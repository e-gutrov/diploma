#include "jsoncons_cursor_validator.h"
#include "table_schema.h"

// TODO: think about refactoring

namespace {
    class SimpleJsonconsValidator : public JsonconsCursorValidator {
    public:
        explicit SimpleJsonconsValidator(ValueType t) : ValueType_(t) {}

        bool Validate(jsoncons::json_cursor *cursor) override {
            auto tp = cursor->current().event_type();
            cursor->next();
            if (ValueType_ == ValueType::Int) {
                return tp == jsoncons::staj_event_type::int64_value || tp == jsoncons::staj_event_type::uint64_value;
            } else if (ValueType_ == ValueType::String) {
                return tp == jsoncons::staj_event_type::string_value ||
                       tp == jsoncons::staj_event_type::byte_string_value;
            }
            assert(0);
        }

    private:
        ValueType ValueType_;
    };

    class OptionalJsonconsValidator : public JsonconsCursorValidator {
    public:
        explicit OptionalJsonconsValidator(std::unique_ptr<JsonconsCursorValidator> child) : ChildValidator_(
                std::move(child)) {}

        bool Validate(jsoncons::json_cursor *cursor) override {
            auto tp = cursor->current().event_type();
            if (tp == jsoncons::staj_event_type::null_value) {
                cursor->next();
                return true;
            } else {
                return ChildValidator_->Validate(cursor);
            }
        }

    private:
        std::unique_ptr<JsonconsCursorValidator> ChildValidator_;
    };

    class ListJsonconsValidator : public JsonconsCursorValidator {
    public:
        explicit ListJsonconsValidator(std::unique_ptr<JsonconsCursorValidator> child) : ChildValidator_(
                std::move(child)) {}

        bool Validate(jsoncons::json_cursor *cursor) override {
            if (cursor->current().event_type() != jsoncons::staj_event_type::begin_array) {
                return false;
            }
            cursor->next();
            while (cursor->current().event_type() != jsoncons::staj_event_type::end_array) {
                if (!ChildValidator_->Validate(cursor)) {
                    return false;
                }
            }
            cursor->next();
            return true;
        }

    private:
        std::unique_ptr<JsonconsCursorValidator> ChildValidator_;
    };

    class TupleJsonconsValidator : public JsonconsCursorValidator {
    public:
        explicit TupleJsonconsValidator(std::vector<std::unique_ptr<JsonconsCursorValidator>> children)
                : ChildValidators_(std::move(children)) {}

        bool Validate(jsoncons::json_cursor *cursor) override {
            if (cursor->current().event_type() != jsoncons::staj_event_type::begin_array) {
                return false;
            }
            cursor->next();
            for (const auto &child: ChildValidators_) {
                if (!child->Validate(cursor)) {
                    return false;
                }
            }
            if (cursor->current().event_type() != jsoncons::staj_event_type::end_array) {
                return false;
            }
            cursor->next();
            return true;
        }

    private:
        std::vector<std::unique_ptr<JsonconsCursorValidator>> ChildValidators_;
    };

    class RootJsonconsValidator : public JsonconsCursorValidator {
    public:
        explicit RootJsonconsValidator(std::unique_ptr<JsonconsCursorValidator> child) : ChildValidator_(
                std::move(child)) {}

        bool Validate(jsoncons::json_cursor *cursor) override {
            auto validationResult = ChildValidator_->Validate(cursor);
            return validationResult && cursor->done();
        }

    private:
        std::unique_ptr<JsonconsCursorValidator> ChildValidator_;
    };
}

std::unique_ptr<JsonconsCursorValidator> CreateJsonconsCursorValidator(const TypeBasePtr& schema, int depth) {
    if (depth == 0) {
        return std::make_unique<RootJsonconsValidator>(CreateJsonconsCursorValidator(schema, depth + 1));
    }
    auto type = schema->GetType();
    switch (type) {
        case ValueType::Int:
        case ValueType::String: {
            return std::make_unique<SimpleJsonconsValidator>(type);
        }
        case ValueType::Optional: {
            return std::make_unique<OptionalJsonconsValidator>(CreateJsonconsCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::List: {
            return std::make_unique<ListJsonconsValidator>(CreateJsonconsCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::Tuple: {
            std::vector<std::unique_ptr<JsonconsCursorValidator>> children;
            for (const auto& child : schema->Children()) {
                children.emplace_back(CreateJsonconsCursorValidator(child->Schema, depth + 1));
            }
            return std::make_unique<TupleJsonconsValidator>(std::move(children));
        }
        case ValueType::Object: {
            assert(0);
        }
        default: {
            assert(0);
        }
    }
}