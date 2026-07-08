#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p82.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p82") u8 AnimSprite_FimbulvetrOBJ_25[] = INCBIN_U8("graphics/reuse/AnimSprite_FimbulvetrOBJ_25.4bpp");
SECTION(".rodata.dat_data_banim_p82") u8 AnimSprite_FimbulvetrOBJ_26[] = INCBIN_U8("graphics/reuse/AnimSprite_FimbulvetrOBJ_26.4bpp");
SECTION(".rodata.dat_data_banim_p82") u8 AnimSprite_FimbulvetrOBJ_27[] = INCBIN_U8("graphics/reuse/AnimSprite_FimbulvetrOBJ_27.4bpp");
struct AnimSpriteData AnimSprite_FimbulvetrOBJ_28[] __attribute__((section(".rodata.dat_data_banim_p82"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF80, 0xFF23, 0x00DD, 0xFF80 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x00FB, 0xFFD3, 0x002D, 0x00FB } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF10, 0x0057, 0xFFA9, 0xFF10 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF5C, 0xFF3D, 0x00C3, 0xFF5C } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -98, 29 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -106, -64 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -48, -19 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -56, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 28, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -79, -56 } } },
    { .header = 0x40000100, .as = { .object = { 0x0008, 26, -79 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, 51, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, 22, -19 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, 14, -52 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, 51, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, 44, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, -107, 4 } } },
    { .header = 0x42000100, .as = { .object = { 0x0008, -92, -2 } } },
    { .header = 0x44000100, .as = { .object = { 0x000A, 34, 20 } } },
    { .header = 0x40000000, .as = { .object = { 0x000E, -60, -54 } } },
    { .header = 0x40000000, .as = { .object = { 0x000E, 3, 9 } } },
    { .header = 0x60000000, .as = { .object = { 0x000E, 56, 3 } } },
    { .header = 0x50000000, .as = { .object = { 0x000E, -122, 17 } } },
    { .header = 0x46000100, .as = { .object = { 0x000A, -106, -29 } } },
    ANIM_SPRITE_END,
};
