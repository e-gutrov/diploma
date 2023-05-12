#include <cstdint>

int FillWithEvents(int8_t* arr, int capacity, void* c);

extern "C" int8_t GetNext(int8_t* arr, int capacity, int* size, int* next, void* cursor) {
    if (*next == *size) {
        *next = 0;
        *size = FillWithEvents(arr, capacity, cursor);
    }
    auto current = *size++;
    return arr[current];
}