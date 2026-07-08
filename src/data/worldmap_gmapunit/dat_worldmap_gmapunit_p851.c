#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p851.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxMantBatabata5_R_1[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p851"))) =
{
    { .header = 0xC0004000, .as = { .object = { 0x0000, -32, -24 } } },
    { .header = 0x40004000, .as = { .object = { 0x0080, -32, 8 } } },
    { .header = 0x40004000, .as = { .object = { 0x0084, 0, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxMantBatabata5_R_2[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p851"))) =
{
    { .header = 0xC0004000, .as = { .object = { 0x0008, -32, -24 } } },
    { .header = 0x40004000, .as = { .object = { 0x0088, -32, 8 } } },
    { .header = 0x40004000, .as = { .object = { 0x008C, 0, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxMantBatabata5_R_3[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p851"))) =
{
    { .header = 0xC0004000, .as = { .object = { 0x0010, -32, -24 } } },
    { .header = 0x40004000, .as = { .object = { 0x0090, -32, 8 } } },
    { .header = 0x40004000, .as = { .object = { 0x0094, 0, 8 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_worldmap_gmapunit_p851") u8 AnimSprite_EfxMantBatabata5_R_4[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxMantBatabata5_R_4.4bpp");
