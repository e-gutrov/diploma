#ifndef COURSEWORK_EXCEPTIONS_H
#define COURSEWORK_EXCEPTIONS_H

#include <stdexcept>

class TypeError : public std::logic_error {
public:
    TypeError(const char* msg);
};

#endif // COURSEWORK_EXCEPTIONS_H
