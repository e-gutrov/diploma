//
// Created by egor on 25/04/23.
//

#include "jsoncons_cursor_validator.h"
#include "table_schema.h"
#include "validators_llvm.h"

class SimpleValidator : public CursorValidator {
public:
    SimpleValidator(ValueType t) : ValueType_(t) {}

//    bool Validate(jsoncons::json_cursor* cursor) {
//        if (ValueType_ == ValueType::Int) {
//            return ValidateSimpleType<ValueType::Int>(cursor);
//        } else if (ValueType_ == ValueType::String) {
//            return ValidateSimpleType<ValueType::String>(cursor);
//        }
//        assert(0);
//    }

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

class OptionalValidator : public CursorValidator {
public:
    OptionalValidator(std::unique_ptr<CursorValidator> child) : ChildValidator_(std::move(child)) {}

//    bool Validate(jsoncons::json_cursor* cursor) {
//        if (IsType<jsoncons::staj_event_type::null_value>(cursor)) {
//            CallNext(cursor);
//            return true;
//        } else {
//            return ChildValidator_->Validate(cursor);
//        }
//    }

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
    std::unique_ptr<CursorValidator> ChildValidator_;
};

class ListValidator : public CursorValidator {
public:
    ListValidator(std::unique_ptr<CursorValidator> child) : ChildValidator_(std::move(child)) {}

//    bool Validate(jsoncons::json_cursor* cursor) {
//        if (!IsType<jsoncons::staj_event_type::begin_array>(cursor)) {
//            return false;
//        }
//        CallNext(cursor);
//        while (!IsType<jsoncons::staj_event_type::end_array>(cursor)) {
//            if (!ChildValidator_->Validate(cursor)) {
//                return false;
//            }
//        }
//        CallNext(cursor);
//        return true;
//    }

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
    std::unique_ptr<CursorValidator> ChildValidator_;
};

//class StructValidator : public CursorValidator {
//public:
//
//private:
//    std::unordered_map<std::string, std::unique_ptr<CursorValidator>> ChildValidators_;
//};

class RootValidator : public CursorValidator {
public:
    RootValidator(std::unique_ptr<CursorValidator> child) : ChildValidator_(std::move(child)) {}

    bool Validate(jsoncons::json_cursor* cursor) {
        auto validationResult = ChildValidator_->Validate(cursor);
        return validationResult && IsDone(cursor);
    }

private:
    std::unique_ptr<CursorValidator> ChildValidator_;
};

std::unique_ptr<CursorValidator> CreateCursorValidator(const TypeBasePtr& schema, int depth) {
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
        case ValueType::Object: {
            assert(0);
        }
        default: {
            assert(0);
        }
    }
}