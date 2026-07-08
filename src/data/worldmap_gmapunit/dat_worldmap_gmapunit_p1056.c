#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1056.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1056") u8 AnimSprite_Tri_13[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_13.4bpp");
struct AnimSpriteData AnimSprite_Tri_14[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p1056"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0039, -30, 4 } } },
    { .header = 0x80004000, .as = { .object = { 0x0013, -36, -12 } } },
    { .header = 0x40000000, .as = { .object = { 0x0017, -4, -12 } } },
    { .header = 0x80004000, .as = { .object = { 0x000F, -35, -28 } } },
    { .header = 0x00004000, .as = { .object = { 0x0019, -3, -20 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -43, -14 } } },
    { .header = 0x00004000, .as = { .object = { 0x002D, -59, -12 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, -67, -13 } } },
    ANIM_SPRITE_END,
};
