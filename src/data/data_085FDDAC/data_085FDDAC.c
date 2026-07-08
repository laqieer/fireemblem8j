#include "global.h"
#include "anime.h"

/* Typed C extraction of residual raw-incbin slices from data_085FDDAC.c. */

struct AnimSpriteData data_085FDDAC[] __attribute__((section(".data.residue.085FDDAC"))) =
{
    { .header = 0x90004000, .as = { .object = { 0x0043, 0, -16 } } },
    { .header = 0x10008000, .as = { .object = { 0x0047, -8, -16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0068, -16, -8 } } },
    { .header = 0x90004000, .as = { .object = { 0x0043, -16, 0 } } },
    { .header = 0x10008000, .as = { .object = { 0x0047, -24, 0 } } },
    { .header = 0x10000000, .as = { .object = { 0x0068, -32, 8 } } },
    { .header = 0x10004000, .as = { .object = { 0x0060, -24, 16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0062, -32, 16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -8, 16 } } },
    { .header = 0x10000000, .as = { .object = { 0x001F, 24, -24 } } },
    { .header = 0x10004000, .as = { .object = { 0x0040, 8, -24 } } },
    { .header = 0x10000000, .as = { .object = { 0x0042, 0, -24 } } },
    { .header = 0x10000000, .as = { .object = { 0x0018, 32, -24 } } },
    ANIM_SPRITE_END,
};
