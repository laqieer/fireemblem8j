#include "common.h"

static int ref(int r0)
{
    return r0;
}

static int impl(int r0)
{
    return r0 + 1;
}

int main(void)
{
    int r0 = nondet_int();
    ASSUME(r0 < 2147483647);
    ASSERT(ref(r0) == impl(r0), "return r0 vs r0+1");
    return 0;
}
