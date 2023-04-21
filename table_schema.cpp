//
// Created by egor on 19/04/23.
//
#include <utility>
#include <vector>

#include "table_schema.h"
#include "exceptions.h"

StructFieldPtr MakeStructField(std::string name, TypeBasePtr schema, bool optional) {
    auto result = std::make_shared<StructField>();
    result->Name = name;
    result->Schema = std::move(schema);
    result->Optional = optional;
    return result;
}

class SimpleType : public TypeBase {
public:
    SimpleType(ValueType t): Type_(t) {}

    ValueType GetType() const override {
        return Type_;
    }

    TypeBasePtr Child() override {
        throw TypeError("Called Child() on SimpleType");
    }

    const std::vector<StructFieldPtr>& Children() const override {
        throw TypeError("Called Children() on SimpleType");
    }

private:
    ValueType Type_;
};

class SingleChildType : public TypeBase {
public:
    SingleChildType(ValueType t, TypeBasePtr child): Type_(t), Child_(std::move(child)) {}

    ValueType GetType() const override {
        return Type_;
    }

    TypeBasePtr Child() override {
        return Child_;
    }

    const std::vector<StructFieldPtr>& Children() const override {
        throw TypeError("Called Children() on SingleChildType");
    }

private:
    ValueType Type_;
    TypeBasePtr Child_;
};

class ObjectType : public TypeBase {
public:
    ObjectType(ValueType t, std::vector<StructFieldPtr> children): Type_(t), Children_(std::move(children)) {}

    ValueType GetType() const override {
        return Type_;
    }

    TypeBasePtr Child() override {
        throw TypeError("Called Child() on ObjectType");
    }

    const std::vector<StructFieldPtr>& Children() const override {
        return Children_;
    }

private:
    ValueType Type_;
    std::vector<StructFieldPtr> Children_;
};

TypeBasePtr CreateSimple(ValueType t) {
    return std::make_shared<SimpleType>(t);
}

TypeBasePtr CreateOptional(TypeBasePtr child) {
    return std::make_shared<SingleChildType>(ValueType::Optional, std::move(child));
}

TypeBasePtr CreateList(TypeBasePtr child) {
    return std::make_shared<SingleChildType>(ValueType::List, std::move(child));
}

TypeBasePtr CreateObject(std::vector<StructFieldPtr> children) {
    return std::make_shared<ObjectType>(ValueType::Object, std::move(children));
}