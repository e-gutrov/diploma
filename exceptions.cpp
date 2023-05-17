#include "exceptions.h"

TypeError::TypeError(const char* msg) : std::logic_error(msg) {}
