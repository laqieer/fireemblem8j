#include "common.h"

struct State {
    u32 gGameClock;
    u16 pal_bg[32];
    unsigned palette_sync_calls;
    u8 palette_sync_enabled;
};

static u16 Pal_GreenTextColors[16];

static u32 us_GetGameClock(struct State *s)
{
    return s->gGameClock;
}

static u32 jp_GetGameClock(struct State *s)
{
    return s->gGameClock;
}

static void us_EnablePaletteSync(struct State *s)
{
    s->palette_sync_calls++;
    s->palette_sync_enabled = 1;
}

static void jp_EnablePaletteSync(struct State *s)
{
    s->palette_sync_calls++;
    s->palette_sync_enabled = 1;
}

static void us_GreenText_OnLoop(struct State *s)
{
    u32 index = (us_GetGameClock(s) / 4) % 16;
    s->pal_bg[14] = *(Pal_GreenTextColors + index);
    us_EnablePaletteSync(s);
}

static void jp_GreenText_OnLoop(struct State *s)
{
    u32 index = (jp_GetGameClock(s) / 4) % 16;
    s->pal_bg[14] = *(Pal_GreenTextColors + index);
    jp_EnablePaletteSync(s);
}

int main(void)
{
    struct State us, jp;
    unsigned i;

    us.gGameClock = jp.gGameClock = nondet_uint();
    us.palette_sync_calls = jp.palette_sync_calls = 0;
    us.palette_sync_enabled = jp.palette_sync_enabled = 0;

    for (i = 0; i < 16; i++)
        Pal_GreenTextColors[i] = nondet_ushort();
    for (i = 0; i < 32; i++)
        us.pal_bg[i] = jp.pal_bg[i] = nondet_ushort();

    us_GreenText_OnLoop(&us);
    jp_GreenText_OnLoop(&jp);

    ASSERT(us.gGameClock == jp.gGameClock, "GreenText clock unchanged");
    ASSERT(us.palette_sync_calls == jp.palette_sync_calls, "GreenText helper call count");
    ASSERT(us.palette_sync_enabled == jp.palette_sync_enabled, "GreenText helper visible effect");
    for (i = 0; i < 32; i++)
        ASSERT(us.pal_bg[i] == jp.pal_bg[i], "GreenText all modeled palette slots");
    return 0;
}
