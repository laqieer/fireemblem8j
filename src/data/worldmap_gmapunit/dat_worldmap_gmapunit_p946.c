#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p946.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxHammarneOBJ_35[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p946"))) =
{
    { .header = 0x10000000, .as = { .object = { 0x001B, 0, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x001B, 4, 3 } } },
    { .header = 0x10000000, .as = { .object = { 0x001B, -15, -18 } } },
    { .header = 0x10000000, .as = { .object = { 0x001B, -19, -14 } } },
    { .header = 0x10000000, .as = { .object = { 0x001B, -23, -10 } } },
    { .header = 0x10000000, .as = { .object = { 0x001B, -26, -5 } } },
    { .header = 0x10000000, .as = { .object = { 0x001A, -28, 0 } } },
    { .header = 0x10000000, .as = { .object = { 0x001A, -29, 6 } } },
    { .header = 0x10000000, .as = { .object = { 0x001B, -28, 12 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_worldmap_gmapunit_p946") u8 AnimSprite_EfxHammarneOBJ_36[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxHammarneOBJ_36.4bpp");
