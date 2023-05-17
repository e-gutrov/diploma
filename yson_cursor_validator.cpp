#include "yson_cursor_validator.h"

#include <iostream>

namespace YsonValidators {
namespace {
template<ValueType T>
class SimpleYsonValidator : public PolymorphicValidator {
public:
    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) override {
        auto tp = cursor->GetCurrent().GetType();
        cursor->Next();
        if constexpr (T == ValueType::Int) {
            return tp == NYT::NYson::EYsonItemType::Int64Value ||
                   tp == NYT::NYson::EYsonItemType::Uint64Value;
        } else if constexpr (T == ValueType::String) {
            return tp == NYT::NYson::EYsonItemType::StringValue;
        } else {
            assert(0);
        }
    }
};

class OptionalYsonValidator : public PolymorphicValidator {
public:
    explicit OptionalYsonValidator(std::unique_ptr<PolymorphicValidator> child)
        : ChildValidator_(std::move(child)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) override {
        auto tp = cursor->GetCurrent().GetType();
        if (tp == NYT::NYson::EYsonItemType::EntityValue) {
            cursor->Next();
            return true;
        } else {
            return ChildValidator_->Validate(cursor);
        }
    }

private:
    std::unique_ptr<PolymorphicValidator> ChildValidator_;
};

class ListYsonValidator : public PolymorphicValidator {
public:
    explicit ListYsonValidator(std::unique_ptr<PolymorphicValidator> child)
        : ChildValidator_(std::move(child)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) override {
        if (cursor->GetCurrent().GetType() !=
            NYT::NYson::EYsonItemType::BeginList) {
            return false;
        }
        cursor->Next();
        while (cursor->GetCurrent().GetType() !=
               NYT::NYson::EYsonItemType::EndList) {
            if (!ChildValidator_->Validate(cursor)) {
                return false;
            }
        }
        cursor->Next();
        return true;
    }

private:
    std::unique_ptr<PolymorphicValidator> ChildValidator_;
};

class TupleYsonValidator : public PolymorphicValidator {
public:
    explicit TupleYsonValidator(
        std::vector<std::unique_ptr<PolymorphicValidator>> children)
        : ChildValidators_(std::move(children)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) override {
        if (cursor->GetCurrent().GetType() !=
            NYT::NYson::EYsonItemType::BeginList) {
            return false;
        }
        cursor->Next();
        for (const auto& child : ChildValidators_) {
            if (!child->Validate(cursor)) {
                return false;
            }
        }
        if (cursor->GetCurrent().GetType() !=
            NYT::NYson::EYsonItemType::EndList) {
            return false;
        }
        cursor->Next();
        return true;
    }

private:
    std::vector<std::unique_ptr<PolymorphicValidator>> ChildValidators_;
};

class RootYsonValidator : public PolymorphicValidator {
public:
    explicit RootYsonValidator(std::unique_ptr<PolymorphicValidator> child)
        : ChildValidator_(std::move(child)) {}

    bool Validate(NYT::NYson::TYsonPullParserCursor* cursor) override {
        auto validationResult = ChildValidator_->Validate(cursor);
        return validationResult && cursor->GetCurrent().IsEndOfStream();
    }

private:
    std::unique_ptr<PolymorphicValidator> ChildValidator_;
};
} // namespace

std::unique_ptr<PolymorphicValidator>
CreatePolymorphicValidator(const TypeBasePtr& schema, int depth) {
    if (depth == 0) {
        return std::make_unique<RootYsonValidator>(
            CreatePolymorphicValidator(schema, depth + 1));
    }
    auto type = schema->GetType();
    switch (type) {
        case ValueType::Int: {
            return std::make_unique<SimpleYsonValidator<ValueType::Int>>();
        }
        case ValueType::String: {
            return std::make_unique<SimpleYsonValidator<ValueType::String>>();
        }
        case ValueType::Optional: {
            return std::make_unique<OptionalYsonValidator>(
                CreatePolymorphicValidator(schema->Child(), depth + 1));
        }
        case ValueType::List: {
            return std::make_unique<ListYsonValidator>(
                CreatePolymorphicValidator(schema->Child(), depth + 1));
        }
        case ValueType::Tuple: {
            std::vector<std::unique_ptr<PolymorphicValidator>> children;
            for (const auto& child : schema->Children()) {
                children.emplace_back(
                    CreatePolymorphicValidator(child->Schema, depth + 1));
            }
            return std::make_unique<TupleYsonValidator>(std::move(children));
        }
        case ValueType::Object: {
            assert(0);
        }
        default: {
            assert(0);
        }
    }
}
} // namespace YsonValidators