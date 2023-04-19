//
// Created by egor on 19/04/23.
//

#include <stdexcept>
#include "exceptions.h"

TypeError::TypeError(const char* msg) : std::logic_error(msg) {}
