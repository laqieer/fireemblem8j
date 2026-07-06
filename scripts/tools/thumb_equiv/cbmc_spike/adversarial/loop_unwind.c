#include "common.h"

static unsigned sum_to_n(unsigned n)
{
    unsigned i = 0;
    unsigned acc = 0;
    while (i < n) {
        acc += i;
        i++;
    }
    return acc;
}

int main(void)
{
    unsigned n = nondet_uint();
    ASSUME(n <= 5);
    ASSERT(sum_to_n(n) == sum_to_n(n), "same loop body");
    return 0;
}
