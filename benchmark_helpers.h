#include "table_schema.h"

#include <random>

// TODO: think about refactoring

// TODO: maybe this should be modular
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

class ConstForOptionsGenerator : public GeneratorBase {
public:
    ConstForOptionsGenerator(bool c);
    bool GenerateIsNull() override;

private:
    bool Const_;
};

std::vector<std::string>
GenerateObjectWithSchema(const TypeBasePtr&, GeneratorBase*, int minSize);