#include "common.h"

struct State {
    int flag;
};

static int ref(struct State *s, int x)
{
    s->flag = x & 1;
    return 0;
}

static int impl(struct State *s, int x)
{
    s->flag = (x & 1) ^ 1;
    return 0;
}

int main(void)
{
    struct State a, b;
    int x = nondet_int();
    a.flag = b.flag = nondet_int();

    ASSERT(ref(&a, x) == impl(&b, x), "return");
    ASSERT(a.flag == b.flag, "same return but different global side effect");
    return 0;
}
