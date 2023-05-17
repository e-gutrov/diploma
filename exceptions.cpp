#include "exceptions.h"
#include <stdexcept>

TypeError::TypeError(const char *msg) : std::logic_error(msg) {}
