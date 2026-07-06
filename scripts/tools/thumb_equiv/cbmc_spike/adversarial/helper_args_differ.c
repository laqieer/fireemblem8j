#include "common.h"

static unsigned call_index;
static int oracle_ret0;

static int shared_oracle(int side, int target, int arg)
{
    (void)side;
    ASSERT(call_index < 2, "oracle call bound");
    ASSERT(target == 7, "same helper target");
    if (call_index == 0)
        ASSERT(arg == 5, "reference helper arg captured");
    else
        ASSERT(arg == 5, "implementation helper arg must match reference");
    call_index++;
    return oracle_ret0;
}

static int ref(void)
{
    return shared_oracle(0, 7, 5);
}

static int impl(void)
{
    return shared_oracle(1, 7, 6);
}

int main(void)
{
    oracle_ret0 = nondet_int();
    ASSERT(ref() == impl(), "same modeled return is insufficient if args differ");
    return 0;
}
