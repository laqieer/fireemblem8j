#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_banim_ekrtriangle_0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_Tri_0[] __attribute__((section(".rodata.dat_banim_ekrtriangle_0"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0051, 38, -55 } } },
    { .header = 0x00008000, .as = { .object = { 0x0053, 54, -55 } } },
    { .header = 0x00000000, .as = { .object = { 0x0050, 40, -63 } } },
    { .header = 0x40000000, .as = { .object = { 0x0054, 48, -71 } } },
    { .header = 0x00000000, .as = { .object = { 0x0070, 30, -47 } } },
    { .header = 0x40004000, .as = { .object = { 0x007B, 24, -39 } } },
    { .header = 0x80004000, .as = { .object = { 0x0040, 7, -23 } } },
    { .header = 0x00008000, .as = { .object = { 0x0044, 39, -23 } } },
    { .header = 0x80004000, .as = { .object = { 0x0045, 0, -39 } } },
    { .header = 0x80004000, .as = { .object = { 0x0049, 8, -55 } } },
    { .header = 0x00004000, .as = { .object = { 0x004D, 32, -31 } } },
    { .header = 0x00004000, .as = { .object = { 0x006D, 40, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x004F, 0, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0056, 3, -79 } } },
    { .header = 0x40000000, .as = { .object = { 0x0058, 3, -63 } } },
    { .header = 0x00008000, .as = { .object = { 0x005A, 19, -63 } } },
    { .header = 0x00004000, .as = { .object = { 0x005B, 11, -47 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrtriangle_0") u8 AnimSprite_Tri_1[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_1.4bpp");
SECTION(".rodata.dat_banim_ekrtriangle_0") u8 AnimSprite_Tri_2[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_2.4bpp");
SECTION(".rodata.dat_banim_ekrtriangle_0") u8 AnimSprite_Tri_3[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_3.4bpp");
SECTION(".rodata.dat_banim_ekrtriangle_0") u8 AnimSprite_Tri_4[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_4.4bpp");
struct AnimSpriteData AnimSprite_Tri_5[] __attribute__((section(".rodata.dat_banim_ekrtriangle_0"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0051, 58, -89 } } },
    { .header = 0x00008000, .as = { .object = { 0x0053, 74, -89 } } },
    { .header = 0x00000000, .as = { .object = { 0x0050, 60, -97 } } },
    { .header = 0x40000000, .as = { .object = { 0x0054, 68, -105 } } },
    { .header = 0x00000000, .as = { .object = { 0x0070, 50, -81 } } },
    { .header = 0x40004000, .as = { .object = { 0x007B, 44, -73 } } },
    { .header = 0x80004000, .as = { .object = { 0x0040, 27, -57 } } },
    { .header = 0x00008000, .as = { .object = { 0x0044, 59, -57 } } },
    { .header = 0x80004000, .as = { .object = { 0x0045, 20, -73 } } },
    { .header = 0x80004000, .as = { .object = { 0x0049, 28, -89 } } },
    { .header = 0x00004000, .as = { .object = { 0x004D, 52, -65 } } },
    { .header = 0x00004000, .as = { .object = { 0x006D, 60, -94 } } },
    { .header = 0x00000000, .as = { .object = { 0x004F, 20, -82 } } },
    { .header = 0x40000000, .as = { .object = { 0x0056, 23, -113 } } },
    { .header = 0x40000000, .as = { .object = { 0x0058, 23, -97 } } },
    { .header = 0x00008000, .as = { .object = { 0x005A, 39, -97 } } },
    { .header = 0x00004000, .as = { .object = { 0x005B, 31, -81 } } },
    ANIM_SPRITE_END,
};
