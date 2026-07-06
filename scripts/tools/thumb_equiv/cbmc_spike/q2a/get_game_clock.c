#include "common.h"

struct State {
    u32 gGameClock;
};

static u32 us_GetGameClock(struct State *s)
{
    return s->gGameClock;
}

static u32 jp_GetGameClock(struct State *s)
{
    return s->gGameClock;
}

int main(void)
{
    struct State us, jp;
    us.gGameClock = jp.gGameClock = nondet_uint();

    ASSERT(us_GetGameClock(&us) == jp_GetGameClock(&jp), "GetGameClock return");
    ASSERT(us.gGameClock == jp.gGameClock, "GetGameClock no visible writes");
    return 0;
}
