//
// Created by egor on 01/05/23.
//

#include "yson_cursor_validator.h"

class SimpleValidator : public YsonCursorValidator {
public:
    SimpleValidator(ValueType t) : ValueType_(t) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) {
        auto tp = cursor->GetCurrent().GetType();
        cursor->Next();
        if (ValueType_ == ValueType::Int) {
            return tp == NYT::NYson::EYsonItemType::Int64Value || tp == NYT::NYson::EYsonItemType::Uint64Value;
        } else if (ValueType_ == ValueType::String) {
            return tp == NYT::NYson::EYsonItemType::StringValue;
        }
        assert(0);
    }

private:
    ValueType ValueType_;
};

class OptionalValidator : public YsonCursorValidator {
public:
    OptionalValidator(std::unique_ptr<YsonCursorValidator> child) : ChildValidator_(std::move(child)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) {
        auto tp = cursor->GetCurrent().GetType();
        if (tp ==  NYT::NYson::EYsonItemType::EntityValue) {
            cursor->Next();
            return true;
        } else {
            return ChildValidator_->Validate(cursor);
        }
    }
private:
    std::unique_ptr<YsonCursorValidator> ChildValidator_;
};

class ListValidator : public YsonCursorValidator {
public:
    ListValidator(std::unique_ptr<YsonCursorValidator> child) : ChildValidator_(std::move(child)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) {
        if (cursor->GetCurrent().GetType() !=NYT::NYson::EYsonItemType::BeginList) {
            return false;
        }
        cursor->Next();
        while (cursor->GetCurrent().GetType() != NYT::NYson::EYsonItemType::EndList) {
            if (!ChildValidator_->Validate(cursor)) {
                return false;
            }
        }
        cursor->Next();
        return true;
    }

private:
    std::unique_ptr<YsonCursorValidator> ChildValidator_;
};

class TupleValidator : public YsonCursorValidator {
public:
    TupleValidator(std::vector<std::unique_ptr<YsonCursorValidator>> children) : ChildValidators_(std::move(children)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) {
        if (cursor->GetCurrent().GetType() != NYT::NYson::EYsonItemType::BeginList) {
            return false;
        }
        cursor->Next();
        for (const auto & child : ChildValidators_) {
            if (!child->Validate(cursor)) {
                return false;
            }
        }
        if (cursor->GetCurrent().GetType() != NYT::NYson::EYsonItemType::EndList) {
            return false;
        }
        cursor->Next();
        return true;
    }
private:
    std::vector<std::unique_ptr<YsonCursorValidator>> ChildValidators_;
};


class RootValidator : public YsonCursorValidator {
public:
    RootValidator(std::unique_ptr<YsonCursorValidator> child) : ChildValidator_(std::move(child)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) {
        auto validationResult = ChildValidator_->Validate(cursor);
        return validationResult && cursor->GetCurrent().IsEndOfStream();
    }

private:
    std::unique_ptr<YsonCursorValidator> ChildValidator_;
};

std::unique_ptr<YsonCursorValidator> CreateCursorValidator(const TypeBasePtr& schema, int depth) {
    if (depth == 0) {
        return std::make_unique<RootValidator>(CreateCursorValidator(schema, depth + 1));
    }
    auto type = schema->GetType();
    switch (type) {
        case ValueType::Int:
        case ValueType::String: {
            return std::make_unique<SimpleValidator>(type);
        }
        case ValueType::Optional: {
            return std::make_unique<OptionalValidator>(CreateCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::List: {
            return std::make_unique<ListValidator>(CreateCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::Tuple: {
            std::vector<std::unique_ptr<YsonCursorValidator>> children;
            for (const auto& child : schema->Children()) {
                children.emplace_back(CreateCursorValidator(child->Schema, depth + 1));
            }
            return std::make_unique<TupleValidator>(std::move(children));
        }
        case ValueType::Object: {
            assert(0);
        }
        default: {
            assert(0);
        }
    }
}