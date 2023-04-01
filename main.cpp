#include <rapidjson/document.h>
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>
#include <rapidjson/schema.h>
#include <rapidjson/memorystream.h>
#include <rapidjson/prettywriter.h>

#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>

#include <iostream>

typedef rapidjson::GenericValue<rapidjson::UTF8<>, rapidjson::CrtAllocator > ValueType;

void rapidjsonParsingExample() {
    const char* json = R"({"project":"rapidjson","stars":10})";
    rapidjson::Document d;
    d.Parse(json);

    // 2. Modify it by DOM.
    rapidjson::Value& s = d["stars"];
    s.SetInt(s.GetInt() + 1);

    // 3. Stringify the DOM
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
    d.Accept(writer);

    // Output {"project":"rapidjson","stars":11}
    std::cout << buffer.GetString() << std::endl;
}


void rapidjsonValidatorExample() {
    const char* json = R"({"project":"rapidjson","stars":10})";
    const char* schema = R"(
    {
        "$schema": "http://json-schema.org/draft-04/schema#",
        "type": "object",
        "properties": {
            "project": {
                "type": "string"
            },
            "stars": {
                "type": "integer"
            }
        },
        "required": [
         "project",
         "stars"
        ]
   })";

    rapidjson::Document d;
    d.Parse(schema);
    rapidjson::SchemaDocument sd(d);
    rapidjson::SchemaValidator validator(sd);
    rapidjson::Reader reader;
    rapidjson::MemoryStream is(json, strlen(json));
    if (!reader.Parse(is, validator) && reader.GetParseErrorCode() != rapidjson::kParseErrorTermination) {
        // Schema validator error would cause kParseErrorTermination, which will handle it in next step.
        fprintf(stderr, "Input is not a valid JSON\n");
        fprintf(stderr, "Error(offset %u): %s\n",
                static_cast<unsigned>(reader.GetErrorOffset()),
                GetParseError_En(reader.GetParseErrorCode()));
    }

    // Check the validation result
    if (validator.IsValid()) {
        printf("Input JSON is valid.\n");
        return;
    }
    else {
        printf("Input JSON is invalid.\n");
        rapidjson::StringBuffer sb;
        validator.GetInvalidSchemaPointer().StringifyUriFragment(sb);
        fprintf(stderr, "Invalid schema: %s\n", sb.GetString());
        fprintf(stderr, "Invalid keyword: %s\n", validator.GetInvalidSchemaKeyword());
        fprintf(stderr, "Invalid code: %d\n", validator.GetInvalidSchemaCode());
        fprintf(stderr, "Invalid message: %s\n", GetValidateError_En(validator.GetInvalidSchemaCode()));
        sb.Clear();
        validator.GetInvalidDocumentPointer().StringifyUriFragment(sb);
        fprintf(stderr, "Invalid document: %s\n", sb.GetString());
        // Detailed violation report is available as a JSON value
        sb.Clear();
        rapidjson::PrettyWriter<rapidjson::StringBuffer> w(sb);
        validator.GetError().Accept(w);
        fprintf(stderr, "Error report:\n%s\n", sb.GetString());
//        CreateErrorMessages(validator.GetError()); https://github.com/Tencent/rapidjson/blob/master/example/schemavalidator/schemavalidator.cpp
        return;
    }
}

void jsonconsParsingExample() {
    std::string data = R"(
    {
       "application": "hiking",
       "reputons": [
       {
           "rater": "HikingAsylum",
           "assertion": "advanced",
           "rated": "Marilyn C",
           "rating": 0.90,
           "confidence": 0.99
         }
       ]
    }
    )";
    jsoncons::json_cursor cursor(data);
    for (; !cursor.done(); cursor.next())
    {
        const auto& event = cursor.current();
        switch (event.event_type())
        {
            case jsoncons::staj_event_type::begin_array:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::end_array:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::begin_object:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::end_object:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::key:
                // Or std::string_view, if supported
                std::cout << event.event_type() << ": " << event.get<jsoncons::string_view>() << "\n";
                break;
            case jsoncons::staj_event_type::string_value:
                // Or std::string_view, if supported
                std::cout << event.event_type() << ": " << event.get<jsoncons::string_view>() << "\n";
                break;
            case jsoncons::staj_event_type::null_value:
                std::cout << event.event_type() << "\n";
                break;
            case jsoncons::staj_event_type::bool_value:
                std::cout << event.event_type() << ": " << std::boolalpha << event.get<bool>() << "\n";
                break;
            case jsoncons::staj_event_type::int64_value:
                std::cout << event.event_type() << ": " << event.get<int64_t>() << "\n";
                break;
            case jsoncons::staj_event_type::uint64_value:
                std::cout << event.event_type() << ": " << event.get<uint64_t>() << "\n";
                break;
            case jsoncons::staj_event_type::double_value:
                std::cout << event.event_type() << ": " << event.get<double>() << "\n";
                break;
            default:
                std::cout << "Unhandled event type: " << event.event_type() << " " << "\n";
                break;
        }
    }
}

void jsonconsValidatorExample() {
    jsoncons::json schema = jsoncons::json::parse(R"(
    {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "type": "object",
        "properties": {
            "project": {
                "type": "string"
            },
            "stars": {
                "type": "integer"
            }
        },
        "required": [
         "project",
         "stars"
        ]
   })");

    // Data
    jsoncons::json data = jsoncons::json::parse(R"({"project":"rapidjson","stars":10})");

    try
    {
        // Throws schema_error if JSON Schema loading fails
        auto sch = jsoncons::jsonschema::make_schema(schema);

        std::size_t error_count = 0;
        auto reporter = [&error_count](const jsoncons::jsonschema::validation_output& o)
        {
            ++error_count;
            std::cout << o.instance_location() << ": " << o.message() << "\n";
        };

        jsoncons::jsonschema::json_validator<jsoncons::json> validator(sch);

        // Will call reporter for each schema violation
        validator.validate(data, reporter);

        std::cout << "\nError count: " << error_count << "\n\n";
    }
    catch (const std::exception& e)
    {
        std::cout << e.what() << '\n';
    }
}

int main() {
    rapidjsonParsingExample();
    rapidjsonValidatorExample();
    jsonconsParsingExample();
    jsonconsValidatorExample();
    return 0;
}
