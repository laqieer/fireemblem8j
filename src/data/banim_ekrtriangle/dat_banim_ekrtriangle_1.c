#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_banim_ekrtriangle_1.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_banim_ekrtriangle_1") u8 AnimSprite_Tri_6[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_6.4bpp");
SECTION(".rodata.dat_banim_ekrtriangle_1") u8 AnimSprite_Tri_7[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_7.4bpp");
SECTION(".rodata.dat_banim_ekrtriangle_1") u8 AnimSprite_Tri_8[] = INCBIN_U8("graphics/reuse/AnimSprite_Tri_8.4bpp");
struct AnimSpriteData AnimSprite_Tri_9[] __attribute__((section(".rodata.dat_banim_ekrtriangle_1"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0051, 74, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0053, 90, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0050, 76, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0054, 84, -24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0070, 66, 0 } } },
    { .header = 0x40004000, .as = { .object = { 0x007B, 60, 8 } } },
    { .header = 0x80004000, .as = { .object = { 0x0040, 43, 24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0044, 75, 24 } } },
    { .header = 0x80004000, .as = { .object = { 0x0045, 36, 8 } } },
    { .header = 0x80004000, .as = { .object = { 0x0049, 44, -8 } } },
    { .header = 0x00004000, .as = { .object = { 0x004D, 68, 16 } } },
    { .header = 0x00004000, .as = { .object = { 0x006D, 76, -13 } } },
    { .header = 0x00000000, .as = { .object = { 0x004F, 36, -1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0056, 39, -32 } } },
    { .header = 0x40000000, .as = { .object = { 0x0058, 39, -16 } } },
    { .header = 0x00008000, .as = { .object = { 0x005A, 55, -16 } } },
    { .header = 0x00004000, .as = { .object = { 0x005B, 47, 0 } } },
    ANIM_SPRITE_END,
};
