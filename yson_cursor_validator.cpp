#include <iostream>

#include "yson_cursor_validator.h"

namespace {
    class SimpleYsonValidator : public YsonCursorValidator {
    public:
        explicit SimpleYsonValidator(ValueType t) : ValueType_(t) {}

        bool Validate(NYT::NYson::TYsonPullParserCursor *cursor) override {
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

    class OptionalYsonValidator : public YsonCursorValidator {
    public:
        explicit OptionalYsonValidator(std::unique_ptr<YsonCursorValidator> child) : ChildValidator_(
                std::move(child)) {}

        bool Validate(NYT::NYson::TYsonPullParserCursor *cursor) override {
            auto tp = cursor->GetCurrent().GetType();
            if (tp == NYT::NYson::EYsonItemType::EntityValue) {
                cursor->Next();
                return true;
            } else {
                return ChildValidator_->Validate(cursor);
            }
        }

    private:
        std::unique_ptr<YsonCursorValidator> ChildValidator_;
    };

    class ListYsonValidator : public YsonCursorValidator {
    public:
        explicit ListYsonValidator(std::unique_ptr<YsonCursorValidator> child) : ChildValidator_(std::move(child)) {}

        bool Validate(NYT::NYson::TYsonPullParserCursor *cursor) override {
            if (cursor->GetCurrent().GetType() != NYT::NYson::EYsonItemType::BeginList) {
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

    class TupleYsonValidator : public YsonCursorValidator {
    public:
        explicit TupleYsonValidator(std::vector<std::unique_ptr<YsonCursorValidator>> children) : ChildValidators_(
                std::move(children)) {}

        bool Validate(NYT::NYson::TYsonPullParserCursor *cursor) override {
            if (cursor->GetCurrent().GetType() != NYT::NYson::EYsonItemType::BeginList) {
                return false;
            }
            cursor->Next();
            for (const auto &child: ChildValidators_) {
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


    class RootYsonValidator : public YsonCursorValidator {
    public:
        explicit RootYsonValidator(std::unique_ptr<YsonCursorValidator> child) : ChildValidator_(std::move(child)) {}

        bool Validate(NYT::NYson::TYsonPullParserCursor *cursor) override {
            auto validationResult = ChildValidator_->Validate(cursor);
            return validationResult && cursor->GetCurrent().IsEndOfStream();
        }

    private:
        std::unique_ptr<YsonCursorValidator> ChildValidator_;
    };
}

std::unique_ptr<YsonCursorValidator> CreateYsonCursorValidator(const TypeBasePtr& schema, int depth) {
    if (depth == 0) {
        return std::make_unique<RootYsonValidator>(CreateYsonCursorValidator(schema, depth + 1));
    }
    auto type = schema->GetType();
    switch (type) {
        case ValueType::Int:
        case ValueType::String: {
            return std::make_unique<SimpleYsonValidator>(type);
        }
        case ValueType::Optional: {
            return std::make_unique<OptionalYsonValidator>(CreateYsonCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::List: {
            return std::make_unique<ListYsonValidator>(CreateYsonCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::Tuple: {
            std::vector<std::unique_ptr<YsonCursorValidator>> children;
            for (const auto& child : schema->Children()) {
                children.emplace_back(CreateYsonCursorValidator(child->Schema, depth + 1));
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