#include "global.h"

// Region-different orphan accessor (value-first args, offset > strh range).
void sub_8020D78(s16 a, void *b)
{
    *(u16 *)((void *)b + 0x50) = a;
}
