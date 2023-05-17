#include "benchmark_helpers.h"

#include <jsoncons/json.hpp>

// TODO: think about refactoring

namespace {
jsoncons::json DoGenerateObjectWithSchema(const TypeBasePtr &schema,
                                          GeneratorBase *generator);

jsoncons::json DoGenerateOptional(const TypeBasePtr &schema,
                                  GeneratorBase *generator) {
  if (generator->GenerateIsNull()) {
    return jsoncons::json::null();
  }
  return DoGenerateObjectWithSchema(schema->Child(), generator);
}

jsoncons::json DoGenerateList(const TypeBasePtr &schema,
                              GeneratorBase *generator) {
  auto length = generator->GenerateListLength();
  std::vector<jsoncons::json> result;
  for (int i = 0; i < length; ++i) {
    result.emplace_back(DoGenerateObjectWithSchema(schema->Child(), generator));
  }
  return jsoncons::json(result);
}

jsoncons::json DoGenerateTuple(const TypeBasePtr &schema,
                               GeneratorBase *generator) {
  std::vector<jsoncons::json> result;
  for (const auto &child : schema->Children()) {
    result.emplace_back(DoGenerateObjectWithSchema(child->Schema, generator));
  }
  return jsoncons::json(result);
}

jsoncons::json DoGenerateObjectWithSchema(const TypeBasePtr &schema,
                                          GeneratorBase *generator) {
  switch (schema->GetType()) {
  case ValueType::Int: {
    return jsoncons::json(generator->GenerateInt());
  }
  case ValueType::String: {
    return jsoncons::json(generator->GenerateString());
  }
  case ValueType::Optional: {
    return DoGenerateOptional(schema, generator);
  }
  case ValueType::List: {
    return DoGenerateList(schema, generator);
  }
  case ValueType::Tuple: {
    return DoGenerateTuple(schema, generator);
  }
  case ValueType::Object: {
    assert(0);
  }
  }
}
} // namespace

GeneratorBase::GeneratorBase() : Generator_(1337) {}

int GeneratorBase::GenerateInt() { return Generator_(); }

std::string GeneratorBase::GenerateString() {
  auto strLen = Generator_() % 1000;
  if (strLen < 0) {
    strLen = -strLen;
  }
  return std::string(strLen, 'a');
}

bool GeneratorBase::GenerateIsNull() { return Generator_() % 2; }

int GeneratorBase::GenerateListLength() {
  int result = Generator_() % 100;
  if (result < 0) {
    result = -result;
  }
  return result;
}

ConstForOptionsGenerator::ConstForOptionsGenerator(bool c)
    : GeneratorBase(), Const_(c) {}

bool ConstForOptionsGenerator::GenerateIsNull() { return Const_; }

std::vector<std::string> GenerateObjectWithSchema(const TypeBasePtr &schema,
                                                  GeneratorBase *generator,
                                                  int minSize) {
  std::vector<std::string> result;
  int sum = 0;
  while (sum < minSize) {
    auto json = DoGenerateObjectWithSchema(schema, generator).to_string();
    sum += json.size();
    result.emplace_back(json);
  }
  return result;
}