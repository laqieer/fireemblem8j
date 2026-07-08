#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p936.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxRestOBJ_35[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p936"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001B, -8, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -12, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, 7, -18 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, 11, -14 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, 15, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, 18, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 20, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 21, 6 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, 20, 12 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_worldmap_gmapunit_p936") u8 AnimSprite_EfxRestOBJ_36[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxRestOBJ_36.4bpp");
