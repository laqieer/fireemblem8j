#include "common.h"

struct State {
    int g0;
    int g1;
};

static int ref(struct State *s)
{
    (void)s;
    return 3;
}

static int impl(struct State *s)
{
    s->g1 = 9;
    return 3;
}

int main(void)
{
    struct State a, b;
    a.g0 = b.g0 = nondet_int();
    a.g1 = b.g1 = nondet_int();

    ASSERT(ref(&a) == impl(&b), "return");
    ASSERT(a.g0 == b.g0 && a.g1 == b.g1, "all modeled mutable globals");
    return 0;
}
