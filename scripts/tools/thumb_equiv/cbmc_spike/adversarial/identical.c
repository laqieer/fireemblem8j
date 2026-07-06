#include "common.h"

static unsigned ref(unsigned r0)
{
    return (r0 * 3u) ^ 0x55u;
}

static unsigned impl(unsigned r0)
{
    return (r0 * 3u) ^ 0x55u;
}

int main(void)
{
    unsigned r0 = nondet_uint();
    ASSERT(ref(r0) == impl(r0), "identical return");
    return 0;
}
