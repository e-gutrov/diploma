//
// Created by egor on 19/04/23.
//

#ifndef COURSEWORK_TABLE_SCHEMA_H
#define COURSEWORK_TABLE_SCHEMA_H

#include <string>
#include <unordered_map>
#include <memory>

enum class ValueType {
    Int,
    Optional,
    List,
    Object,
};

class TypeBase;
using TypeBasePtr = std::shared_ptr<TypeBase>;

struct StructField {
    std::string Name;
    std::shared_ptr<TypeBase> Schema;
};
using StructFieldPtr = std::shared_ptr<StructField>;

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
