#include "common.h"

struct State {
    int global;
};

static int ref(struct State *s, int *p)
{
    *p = 11;
    (void)s;
    return 0;
}

static int impl(struct State *s, int *p)
{
    (void)s;
    (void)p;
    return 0;
}

int main(void)
{
    struct State a, b;
    int init = nondet_int();
    a.global = b.global = init;

    ASSERT(ref(&a, &a.global) == impl(&b, &b.global), "return");
    ASSERT(a.global == b.global, "pointer alias to modeled global");
    return 0;
}
