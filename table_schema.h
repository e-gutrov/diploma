//
// Created by egor on 19/04/23.
//

#ifndef COURSEWORK_TABLE_SCHEMA_H
#define COURSEWORK_TABLE_SCHEMA_H

#include <string>
#include <vector>
#include <memory>

enum class ValueType {
    Int,
    String,
    Optional,
    List,
    Object,
};

class TypeBase;
using TypeBasePtr = std::shared_ptr<TypeBase>;

struct StructField {
    std::string Name;
    TypeBasePtr Schema;
    bool Optional;
};
using StructFieldPtr = std::shared_ptr<StructField>;

StructFieldPtr MakeStructField(std::string name, TypeBasePtr schema, bool optional = false);

class TypeBase {
public:
    virtual ValueType GetType() const = 0;
    virtual TypeBasePtr Child() = 0;
    virtual const std::vector<StructFieldPtr>& Children() const = 0;
};

TypeBasePtr CreateSimple(ValueType);
TypeBasePtr CreateOptional(TypeBasePtr);
TypeBasePtr CreateList(TypeBasePtr);
TypeBasePtr CreateObject(std::vector<StructFieldPtr>);

#endif //COURSEWORK_TABLE_SCHEMA_H
