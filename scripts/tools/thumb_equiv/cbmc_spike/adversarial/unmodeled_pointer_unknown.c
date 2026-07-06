#include "common.h"

struct State {
    int modeled_global;
};

static void write_through_unknown_pointer(int *p)
{
    *p = 42;
}

int main(void)
{
    struct State s;
    int local;
    int *p;
    s.modeled_global = nondet_int();
    local = nondet_int();
    p = nondet_uint() ? &s.modeled_global : &local;

    write_through_unknown_pointer(p);
    ASSERT(p == &s.modeled_global, "UNKNOWN: pointer may alias unmodeled storage");
    return 0;
}
