#include "../../adversarial/common.h"

struct BitmapState {
    unsigned short dst[4];
};

static void reference_add_attr(struct BitmapState *s, unsigned idx, unsigned short value)
{
    ASSUME(idx < 4);
    s->dst[idx] = value;
}

static void mutated_add_attr(struct BitmapState *s, unsigned idx, unsigned short value)
{
    ASSUME(idx < 4);
    s->dst[idx] = value ^ 1u;
}

int main(void)
{
    struct BitmapState ref, imp;
    unsigned i;
    unsigned idx = nondet_uint();
    unsigned short value = nondet_uint();

    ASSUME(idx < 32 * 32);

    for (i = 0; i < 4; i++)
        ref.dst[i] = imp.dst[i] = nondet_uint();

    reference_add_attr(&ref, idx, value);
    mutated_add_attr(&imp, idx, value);

    for (i = 0; i < 4; i++)
        ASSERT(ref.dst[i] == imp.dst[i], "sub_8001570 mutation must refute changed write");

    return 0;
}
