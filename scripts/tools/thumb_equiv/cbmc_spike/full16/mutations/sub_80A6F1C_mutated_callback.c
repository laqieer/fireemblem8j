#include "../../adversarial/common.h"

struct CodecState {
    unsigned char payload[8];
    int cbarg;
    int callback_target;
    int callback_arg0_seen;
};

static int shared_callback_oracle(int call_index, int target, int cbarg, unsigned char first)
{
    ASSERT(call_index == 0, "callback call index");
    ASSERT(target == 0x80A6F1C, "callback target");
    return cbarg + first;
}

static int reference_decode(struct CodecState *s, int target)
{
    s->callback_target = target;
    s->callback_arg0_seen = s->cbarg;
    return shared_callback_oracle(0, target, s->cbarg, s->payload[0]);
}

static int mutated_decode(struct CodecState *s, int target)
{
    s->callback_target = target;
    s->callback_arg0_seen = s->cbarg + 1;
    return shared_callback_oracle(0, target, s->cbarg + 1, s->payload[0]);
}

int main(void)
{
    struct CodecState ref, imp;
    unsigned i;
    int target = 0x80A6F1C;
    int r_ref, r_imp;

    ref.cbarg = imp.cbarg = nondet_int();
    ref.callback_target = imp.callback_target = nondet_int();
    ref.callback_arg0_seen = imp.callback_arg0_seen = nondet_int();

    for (i = 0; i < 8; i++)
        ref.payload[i] = imp.payload[i] = nondet_uchar();

    r_ref = reference_decode(&ref, target);
    r_imp = mutated_decode(&imp, target);

    ASSERT(r_ref == r_imp, "sub_80A6F1C mutation must refute callback arg");
    ASSERT(ref.callback_arg0_seen == imp.callback_arg0_seen, "callback visible argument");
    ASSERT(ref.callback_target == imp.callback_target, "callback target/order");
    for (i = 0; i < 8; i++)
        ASSERT(ref.payload[i] == imp.payload[i], "payload unchanged");

    return 0;
}
