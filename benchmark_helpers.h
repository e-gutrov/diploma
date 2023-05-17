#include "table_schema.h"

#include <random>

// TODO: think about refactoring

class GeneratorBase {
public:
    GeneratorBase();
    virtual int GenerateInt();
    virtual std::string GenerateString();
    virtual bool GenerateIsNull();
    virtual int GenerateListLength();

private:
    std::mt19937 Generator_;
};

std::vector<std::string> GenerateObjectWithSchema(const TypeBasePtr&, GeneratorBase*, int minSize);