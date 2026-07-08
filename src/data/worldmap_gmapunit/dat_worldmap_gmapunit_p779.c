#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p779.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EkrBaseKaiten_59[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x10004000, .as = { .object = { 0x0051, 9, -18 } } },
    { .header = 0x10004000, .as = { .object = { 0x0071, 9, 6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 9, -10 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -7, -7 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -23, -5 } } },
    { .header = 0x10004000, .as = { .object = { 0x0053, -7, -15 } } },
    { .header = 0x10004000, .as = { .object = { 0x0073, -7, 9 } } },
    { .header = 0x10004000, .as = { .object = { 0x0055, -23, -13 } } },
    { .header = 0x10004000, .as = { .object = { 0x0075, -23, 11 } } },
    { .header = 0x10008000, .as = { .object = { 0x0057, -31, -7 } } },
    { .header = 0x10000000, .as = { .object = { 0x005D, -31, 9 } } },
    { .header = 0x50000000, .as = { .object = { 0x004F, 25, -7 } } },
    { .header = 0x10000000, .as = { .object = { 0x006B, 41, -5 } } },
    { .header = 0x10000000, .as = { .object = { 0x007D, 25, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_60[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x10004000, .as = { .object = { 0x0086, 12, -14 } } },
    { .header = 0x10004000, .as = { .object = { 0x0088, -4, -14 } } },
    { .header = 0x10004000, .as = { .object = { 0x008A, -20, -14 } } },
    { .header = 0x10004000, .as = { .object = { 0x00A6, 12, 10 } } },
    { .header = 0x10004000, .as = { .object = { 0x00A8, -4, 10 } } },
    { .header = 0x10004000, .as = { .object = { 0x00AA, -20, 10 } } },
    { .header = 0x10008000, .as = { .object = { 0x008C, -28, -6 } } },
    { .header = 0x10000000, .as = { .object = { 0x00AD, -36, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 12, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -4, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -20, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0083, 36, -6 } } },
    { .header = 0x10008000, .as = { .object = { 0x0085, 28, -6 } } },
    { .header = 0x10004000, .as = { .object = { 0x008E, -36, -14 } } },
    { .header = 0x10000000, .as = { .object = { 0x00AE, 28, 10 } } },
    { .header = 0x10000000, .as = { .object = { 0x00AF, -28, 10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_61[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -9, -5 } } },
    { .header = 0x00004000, .as = { .object = { 0x0000, -9, -13 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_62[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0004, -10, -12 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, -5, 4 } } },
    { .header = 0x00004000, .as = { .object = { 0x0022, -11, -20 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_worldmap_gmapunit_p779") u8 AnimSprite_EkrBaseKaiten_63[] = INCBIN_U8("graphics/reuse/AnimSprite_EkrBaseKaiten_63.4bpp");
struct AnimSpriteData AnimSprite_EkrBaseKaiten_64[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0043, -32, -17 } } },
    { .header = 0x00008000, .as = { .object = { 0x0047, 0, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0068, 8, -9 } } },
    { .header = 0x80004000, .as = { .object = { 0x0043, -16, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x0047, 16, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0068, 24, 7 } } },
    { .header = 0x00004000, .as = { .object = { 0x0060, 8, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, 24, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 0, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x001F, -32, -25 } } },
    { .header = 0x00004000, .as = { .object = { 0x0040, -24, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0042, -8, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0018, -40, -25 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_65[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0051, -21, -18 } } },
    { .header = 0x00004000, .as = { .object = { 0x0071, -21, 6 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -21, -10 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -5, -7 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 11, -5 } } },
    { .header = 0x00004000, .as = { .object = { 0x0053, -5, -15 } } },
    { .header = 0x00004000, .as = { .object = { 0x0073, -5, 9 } } },
    { .header = 0x00004000, .as = { .object = { 0x0055, 11, -13 } } },
    { .header = 0x00004000, .as = { .object = { 0x0075, 11, 11 } } },
    { .header = 0x00008000, .as = { .object = { 0x0057, 27, -7 } } },
    { .header = 0x00000000, .as = { .object = { 0x005D, 27, 9 } } },
    { .header = 0x40000000, .as = { .object = { 0x004F, -37, -7 } } },
    { .header = 0x00000000, .as = { .object = { 0x006B, -45, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x007D, -29, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_66[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0086, -24, -16 } } },
    { .header = 0x00004000, .as = { .object = { 0x0088, -8, -16 } } },
    { .header = 0x00004000, .as = { .object = { 0x008A, 8, -16 } } },
    { .header = 0x00004000, .as = { .object = { 0x00A6, -24, 8 } } },
    { .header = 0x00004000, .as = { .object = { 0x00A8, -8, 8 } } },
    { .header = 0x00004000, .as = { .object = { 0x00AA, 8, 8 } } },
    { .header = 0x00008000, .as = { .object = { 0x008C, 24, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x00AD, 32, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -24, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -8, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 8, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0083, -48, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0085, -32, -8 } } },
    { .header = 0x00004000, .as = { .object = { 0x008E, 24, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x00AE, -32, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x00AF, 24, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_67[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0000, -9, -12 } } },
    { .header = 0x10004000, .as = { .object = { 0x0000, -9, 4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_68[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0008, -6, -20 } } },
    { .header = 0x50000000, .as = { .object = { 0x000A, -8, -4 } } },
    { .header = 0x10008000, .as = { .object = { 0x000C, -6, 12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_69[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p779"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0015, 1, -22 } } },
    { .header = 0x10008000, .as = { .object = { 0x0017, -7, -22 } } },
    { .header = 0x90004000, .as = { .object = { 0x0019, -16, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x001D, -15, 10 } } },
    { .header = 0x10000000, .as = { .object = { 0x0034, 1, 10 } } },
    { .header = 0x10000000, .as = { .object = { 0x0038, -9, 26 } } },
    ANIM_SPRITE_END,
};
