//
// Created by egor on 19/04/23.
//

#ifndef COURSEWORK_EXCEPTIONS_H
#define COURSEWORK_EXCEPTIONS_H

class TypeError : public std::logic_error {
public:
    TypeError(const char *msg);
};

#endif //COURSEWORK_EXCEPTIONS_H
