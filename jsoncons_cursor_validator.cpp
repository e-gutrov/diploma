//
// Created by egor on 25/04/23.
//

#include "jsoncons_cursor_validator.h"
#include "table_schema.h"

class SimpleValidator : public JsonconsCursorValidator {
public:
    SimpleValidator(ValueType t) : ValueType_(t) {}

    bool Validate(jsoncons::json_cursor* cursor) {
        auto tp = cursor->current().event_type();
        cursor->next();
        if (ValueType_ == ValueType::Int) {
            return tp == jsoncons::staj_event_type::int64_value || tp == jsoncons::staj_event_type::uint64_value;
        } else if (ValueType_ == ValueType::String) {
            return tp == jsoncons::staj_event_type::string_value || tp == jsoncons::staj_event_type::byte_string_value;
        }
        assert(0);
    }

private:
    ValueType ValueType_;
};

class OptionalValidator : public JsonconsCursorValidator {
public:
    OptionalValidator(std::unique_ptr<JsonconsCursorValidator> child) : ChildValidator_(std::move(child)) {}

    bool Validate(jsoncons::json_cursor* cursor) {
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

class ListValidator : public JsonconsCursorValidator {
public:
    ListValidator(std::unique_ptr<JsonconsCursorValidator> child) : ChildValidator_(std::move(child)) {}

    bool Validate(jsoncons::json_cursor* cursor) {
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

class TupleValidator : public JsonconsCursorValidator {
public:
    TupleValidator(std::vector<std::unique_ptr<JsonconsCursorValidator>> children) : ChildValidators_(std::move(children)) {}

    bool Validate(jsoncons::json_cursor* cursor) {
        if (cursor->current().event_type() != jsoncons::staj_event_type::begin_array) {
            return false;
        }
        cursor->next();
        for (const auto & child : ChildValidators_) {
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

class RootValidator : public JsonconsCursorValidator {
public:
    RootValidator(std::unique_ptr<JsonconsCursorValidator> child) : ChildValidator_(std::move(child)) {}

    bool Validate(jsoncons::json_cursor* cursor) {
        auto validationResult = ChildValidator_->Validate(cursor);
        return validationResult && cursor->done();
    }

private:
    std::unique_ptr<JsonconsCursorValidator> ChildValidator_;
};

std::unique_ptr<JsonconsCursorValidator> CreateJsonconsCursorValidator(const TypeBasePtr& schema, int depth) {
    if (depth == 0) {
        return std::make_unique<RootValidator>(CreateJsonconsCursorValidator(schema, depth + 1));
    }
    auto type = schema->GetType();
    switch (type) {
        case ValueType::Int:
        case ValueType::String: {
            return std::make_unique<SimpleValidator>(type);
        }
        case ValueType::Optional: {
            return std::make_unique<OptionalValidator>(CreateJsonconsCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::List: {
            return std::make_unique<ListValidator>(CreateJsonconsCursorValidator(schema->Child(), depth + 1));
        }
        case ValueType::Tuple: {
            std::vector<std::unique_ptr<JsonconsCursorValidator>> children;
            for (const auto& child : schema->Children()) {
                children.emplace_back(CreateJsonconsCursorValidator(child->Schema, depth + 1));
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