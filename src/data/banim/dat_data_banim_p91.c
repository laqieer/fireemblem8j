#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p91.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_2[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF04, 0x002C, 0x002C, 0x00FC } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF10, 0xFFA8, 0xFFA8, 0x00F0 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -79, -34 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -80, -27 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_3[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF10, 0x0057, 0x0057, 0x00F0 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF04, 0x002C, 0x002C, 0x00FC } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF3D, 0xFF5B, 0xFF5B, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -75, -36 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, -72, -32 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -74, -23 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_4[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF10, 0x0057, 0x0057, 0x00F0 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF04, 0x002C, 0x002C, 0x00FC } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF4B, 0xFF26, 0xFF26, 0x00B5 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -72, -38 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, -67, -32 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -71, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_5[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF23, 0x007F, 0x007F, 0x00DD } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF73, 0xFF0A, 0xFF0A, 0x008D } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFEE9, 0x0031, 0x0031, 0x0117 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -70, -41 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -69, -14 } } },
    { .header = 0x84000100, .as = { .object = { 0x0000, -64, -33 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_6[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF3C, 0x00A4, 0x00A4, 0x00C4 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFEC4, 0x0037, 0x0037, 0x013C } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFFA0, 0xFEF5, 0xFEF5, 0x0060 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE54, 0x0000, 0x0000, 0x01AC } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -66, -45 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, -60, -34 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -67, -11 } } },
    { .header = 0x86000100, .as = { .object = { 0x0008, -54, -25 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_7[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_7.4bpp");
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_8[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_8.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_9[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE78, 0x0148, 0x0148, 0x0188 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF10, 0xFFA8, 0xFFA8, 0x00F0 } } },
    { .header = 0x90004000, .as = { .object = { 0x000C, -13, -25 } } },
    { .header = 0x90000000, .as = { .object = { 0x0000, -43, -66 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -34, -46 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -50, 6 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_10[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_10.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_11[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF8D, 0xFF36, 0xFF36, 0x0073 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0093, 0x0195, 0x0195, 0xFF6D } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF3C, 0x00A4, 0x00A4, 0x00C4 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -23, -50 } } },
    { .header = 0x50000000, .as = { .object = { 0x0010, -17, -39 } } },
    { .header = 0x10008000, .as = { .object = { 0x0012, -25, -39 } } },
    { .header = 0x10004000, .as = { .object = { 0x0050, -17, -23 } } },
    { .header = 0x10000000, .as = { .object = { 0x0052, -25, -23 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, -27, -63 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -30, -3 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_12[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_12.4bpp");
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_13[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_13.4bpp");
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_14[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_14.4bpp");
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_15[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_15.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_16[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0xFFAA, 0xFF10, 0xFF10, 0x0056 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0058, 0x01F8, 0x00FC, 0xFFD4 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0117, 0x0031, 0x0031, 0xFEE9 } } },
    { .header = 0x90000000, .as = { .object = { 0x0008, -16, -15 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -42, -19 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -26, -65 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -30, 1 } } },
    { .header = 0xA0008000, .as = { .object = { 0x0010, 40, -19 } } },
    { .header = 0x60008000, .as = { .object = { 0x0012, 56, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x0008, 35, -42 } } },
    { .header = 0x10004000, .as = { .object = { 0x007E, 19, -41 } } },
    { .header = 0x10004000, .as = { .object = { 0x005E, 3, -42 } } },
    { .header = 0x00004000, .as = { .object = { 0x005E, 33, -40 } } },
    { .header = 0x90000000, .as = { .object = { 0x0008, 29, -42 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p91") u8 AnimSprite_EfxAlacaliburOBJ_Front_17[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Front_17.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_18[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0xFFAA, 0xFF10, 0xFF10, 0x0056 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFFC1, 0x0168, 0x0168, 0x003F } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0037, 0xFEC4, 0x00FC, 0x002C } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -29, 12 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -36, -17 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -29, -60 } } },
    { .header = 0x90000000, .as = { .object = { 0x0008, 16, -15 } } },
    { .header = 0x30004000, .as = { .object = { 0x005E, 27, -23 } } },
    { .header = 0x30004000, .as = { .object = { 0x005E, 20, -20 } } },
    { .header = 0x90000000, .as = { .object = { 0x0008, 26, -42 } } },
    { .header = 0x00004000, .as = { .object = { 0x005E, 27, -40 } } },
    { .header = 0x10004000, .as = { .object = { 0x005E, 11, -41 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_19[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF93, 0xFED3, 0xFED3, 0x006D } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF83, 0x0157, 0x0157, 0x007D } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFEBF, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x002D, 0xFF04, 0xFF04, 0xFFD3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -24, 26 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -29, -27 } } },
    { .header = 0x84000100, .as = { .object = { 0x0013, 27, -15 } } },
    { .header = 0x86000100, .as = { .object = { 0x0000, -34, -44 } } },
    { .header = 0x00004000, .as = { .object = { 0x001E, 21, -21 } } },
    { .header = 0x10004000, .as = { .object = { 0x001E, 1, -19 } } },
    { .header = 0x10004000, .as = { .object = { 0x001E, 21, -24 } } },
    { .header = 0x10004000, .as = { .object = { 0x003E, 14, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x0013, 19, -40 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_20[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF49, 0x013C, 0x013C, 0x00B7 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x002D, 0xFF04, 0xFF04, 0xFFD3 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF6E, 0xFE6B, 0xFE6B, 0x0092 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -21, -41 } } },
    { .header = 0x82000100, .as = { .object = { 0x0013, 36, -15 } } },
    { .header = 0x84000100, .as = { .object = { 0x0000, -38, -29 } } },
    { .header = 0x86000100, .as = { .object = { 0x0004, -21, 29 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_21[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF32, 0x00F5, 0x00F5, 0x00CE } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x002D, 0xFF04, 0xFF04, 0xFFD3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -15, -49 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, -43, -9 } } },
    { .header = 0x20004000, .as = { .object = { 0x001E, 6, -15 } } },
    { .header = 0x30004000, .as = { .object = { 0x007E, -12, -14 } } },
    { .header = 0x30004000, .as = { .object = { 0x005E, -28, -13 } } },
    { .header = 0x20004000, .as = { .object = { 0x005E, 4, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_22[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF32, 0x00F5, 0x00F5, 0x00CE } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x002D, 0xFF04, 0xFF04, 0xFFD3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -9, -57 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, -45, 5 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_23[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFEE8, 0x00EB, 0x00EB, 0x0118 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0038, 0xFEC5, 0xFEC5, 0xFFC8 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -5, -64 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -47, 8 } } },
    { .header = 0x10004000, .as = { .object = { 0x001E, -51, -10 } } },
    { .header = 0x00004000, .as = { .object = { 0x001E, -35, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_24[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE45, 0x00FF, 0x00FF, 0x01BB } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x005A, 0xFE08, 0xFE08, 0xFFA6 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 0, -68 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -47, 15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_25[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0000, -88, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_26[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF23, 0xFF80, 0xFF80, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -82, -53 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_27[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF23, 0xFF80, 0xFF80, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -74, -46 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_28[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE8E, 0xFF29, 0xFF80, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -69, -40 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_29[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x01BB, 0x0100, 0x0080, 0xFF23 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -72, -43 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_30[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00F5, 0x008E, 0x008E, 0xFF0B } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -82, -50 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_31[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0115, 0x00A0, 0x00A0, 0xFEEB } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -92, -59 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_32[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0172, 0x00D6, 0x00D6, 0xFE8E } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -102, -68 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_33[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0115, 0x00A0, 0x00A0, 0xFEEB } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -113, -78 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_34[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00F5, 0x008E, 0x008E, 0xFF0B } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -123, -87 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_35[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0172, 0x00D6, 0x0080, 0xFF23 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -128, -90 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_36[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE8E, 0xFF29, 0xFF80, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -125, -82 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_37[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF3D, 0xFF5B, 0xFF5B, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -120, -77 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_38[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF3D, 0xFF5B, 0xFF5B, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -115, -66 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_39[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF3D, 0xFF5B, 0xFF5B, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -106, -52 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Front_40[] __attribute__((section(".rodata.dat_data_banim_p91"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF3D, 0xFF5B, 0xFF5B, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -97, -40 } } },
    ANIM_SPRITE_END,
};
