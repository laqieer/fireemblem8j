#include "common.h"

static int oracle_ret0;
static unsigned call_index;

static int shared_oracle(int side, int target, int arg0, int arg1)
{
    ASSERT(call_index < 2, "oracle call bound");
    ASSERT(target == 9, "same helper target");
    ASSERT(arg0 == 12 && arg1 == 34, "same helper args");
    ASSERT(side == (int)call_index, "same call order");
    call_index++;
    return oracle_ret0;
}

static int ref(void)
{
    return shared_oracle(0, 9, 12, 34);
}

static int impl(void)
{
    return shared_oracle(1, 9, 12, 34);
}

int main(void)
{
    oracle_ret0 = nondet_int();
    ASSERT(ref() == impl(), "shared call-indexed oracle");
    ASSERT(call_index == 2, "both sides called once");
    return 0;
}
