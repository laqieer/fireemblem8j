#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p89.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_2[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x00FC, 0x002C, 0xFFD4, 0x00FC } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00F0, 0xFFA8, 0x0058, 0x00F0 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 47, -34 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, 48, -27 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_3[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x00F0, 0x0057, 0xFFA9, 0x00F0 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x00FC, 0x002C, 0xFFD4, 0x00FC } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x00C3, 0xFF5B, 0x00A5, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 43, -36 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, 40, -32 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, 42, -23 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_4[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x00F0, 0x0057, 0xFFA9, 0x00F0 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x00FC, 0x002C, 0xFFD4, 0x00FC } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x00B5, 0xFF26, 0x00DA, 0x00B5 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 40, -38 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, 35, -32 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, 39, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_5[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x00DD, 0x007F, 0xFF81, 0x00DD } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x008D, 0xFF0A, 0x00F6, 0x008D } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0117, 0x0031, 0xFFCF, 0x0117 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 38, -41 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, 37, -14 } } },
    { .header = 0x84000100, .as = { .object = { 0x0000, 32, -33 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_6[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x00C4, 0x00A4, 0xFF5C, 0x00C4 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x013C, 0x0037, 0xFFC9, 0x013C } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0060, 0xFEF5, 0x010B, 0x0060 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x01AC, 0x0000, 0x0000, 0x01AC } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 34, -45 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, 28, -34 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, 35, -11 } } },
    { .header = 0x86000100, .as = { .object = { 0x0008, 22, -25 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_7[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_7.4bpp");
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_8[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_8.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_9[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0188, 0x0148, 0xFEB8, 0x0188 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00F0, 0xFFA8, 0x0058, 0x00F0 } } },
    { .header = 0x80004000, .as = { .object = { 0x000C, -19, -25 } } },
    { .header = 0x80000000, .as = { .object = { 0x0000, 11, -66 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 2, -46 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, 18, 6 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_10[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_10.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_11[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x0073, 0xFF36, 0x00CA, 0x0073 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF6D, 0x0195, 0xFE6B, 0xFF6D } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x00C4, 0x00A4, 0xFF5C, 0x00C4 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -9, -50 } } },
    { .header = 0x40000000, .as = { .object = { 0x0010, 1, -39 } } },
    { .header = 0x00008000, .as = { .object = { 0x0012, 17, -39 } } },
    { .header = 0x00004000, .as = { .object = { 0x0050, 1, -23 } } },
    { .header = 0x00000000, .as = { .object = { 0x0052, 17, -23 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, -5, -63 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -2, -3 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_12[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_12.4bpp");
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_13[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_13.4bpp");
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_14[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_14.4bpp");
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_15[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_15.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_16[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x0056, 0xFF10, 0x00F0, 0x0056 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFFA8, 0x01F8, 0xFF04, 0xFFD4 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFEE9, 0x0031, 0xFFCF, 0xFEE9 } } },
    { .header = 0x80000000, .as = { .object = { 0x0008, -16, -15 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 10, -19 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -6, -65 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -2, 1 } } },
    { .header = 0xB0008000, .as = { .object = { 0x0010, -56, -19 } } },
    { .header = 0x70008000, .as = { .object = { 0x0012, -64, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x0008, -67, -42 } } },
    { .header = 0x00004000, .as = { .object = { 0x007E, -35, -41 } } },
    { .header = 0x00004000, .as = { .object = { 0x005E, -19, -42 } } },
    { .header = 0x10004000, .as = { .object = { 0x005E, -49, -40 } } },
    { .header = 0x80000000, .as = { .object = { 0x0008, -61, -42 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p89") u8 AnimSprite_EfxAlacaliburOBJ_Back_17[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxAlacaliburOBJ_Back_17.4bpp");
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_18[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x0056, 0xFF10, 0x00F0, 0x0056 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x003F, 0x0168, 0xFE98, 0x003F } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFFC9, 0xFEC4, 0xFF04, 0x002C } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -3, 12 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, 4, -17 } } },
    { .header = 0x84000100, .as = { .object = { 0x0004, -3, -60 } } },
    { .header = 0x80000000, .as = { .object = { 0x0008, -48, -15 } } },
    { .header = 0x20004000, .as = { .object = { 0x005E, -43, -23 } } },
    { .header = 0x20004000, .as = { .object = { 0x005E, -36, -20 } } },
    { .header = 0x80000000, .as = { .object = { 0x0008, -58, -42 } } },
    { .header = 0x10004000, .as = { .object = { 0x005E, -43, -40 } } },
    { .header = 0x00004000, .as = { .object = { 0x005E, -27, -41 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_19[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x006D, 0xFED3, 0x012D, 0x006D } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x007D, 0x0157, 0xFEA9, 0x007D } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFFD3, 0xFF04, 0x00FC, 0xFFD3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -8, 26 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, -3, -27 } } },
    { .header = 0x84000100, .as = { .object = { 0x0013, -59, -15 } } },
    { .header = 0x86000100, .as = { .object = { 0x0000, 2, -44 } } },
    { .header = 0x10004000, .as = { .object = { 0x001E, -37, -21 } } },
    { .header = 0x00004000, .as = { .object = { 0x001E, -17, -19 } } },
    { .header = 0x00004000, .as = { .object = { 0x001E, -37, -24 } } },
    { .header = 0x00004000, .as = { .object = { 0x003E, -30, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x0013, -51, -40 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_20[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x00B7, 0x013C, 0xFEC4, 0x00B7 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFFD3, 0xFF04, 0x00FC, 0xFFD3 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0092, 0xFE6B, 0x0195, 0x0092 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -11, -41 } } },
    { .header = 0x82000100, .as = { .object = { 0x0013, -68, -15 } } },
    { .header = 0x84000100, .as = { .object = { 0x0000, 6, -29 } } },
    { .header = 0x86000100, .as = { .object = { 0x0004, -11, 29 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_21[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x00CE, 0x00F5, 0xFF0B, 0x00CE } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFFD3, 0xFF04, 0x00FC, 0xFFD3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -17, -49 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, 11, -9 } } },
    { .header = 0x30004000, .as = { .object = { 0x001E, -22, -15 } } },
    { .header = 0x20004000, .as = { .object = { 0x007E, -4, -14 } } },
    { .header = 0x20004000, .as = { .object = { 0x005E, 12, -13 } } },
    { .header = 0x30004000, .as = { .object = { 0x005E, -20, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_22[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x00CE, 0x00F5, 0xFF0B, 0x00CE } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFFD3, 0xFF04, 0x00FC, 0xFFD3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -23, -57 } } },
    { .header = 0x82000100, .as = { .object = { 0x0000, 13, 5 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_23[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0118, 0x00EB, 0xFF15, 0x0118 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFFC8, 0xFEC5, 0x013B, 0xFFC8 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -27, -64 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, 15, 8 } } },
    { .header = 0x00004000, .as = { .object = { 0x001E, 35, -10 } } },
    { .header = 0x10004000, .as = { .object = { 0x001E, 19, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_24[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x01BB, 0x00FF, 0xFF01, 0x01BB } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFFA6, 0xFE08, 0x01F8, 0xFFA6 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -32, -68 } } },
    { .header = 0x82000100, .as = { .object = { 0x0004, 15, 15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_25[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, 56, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_26[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00DD, 0xFF80, 0x0080, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 50, -53 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_27[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00DD, 0xFF80, 0x0080, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 42, -46 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_28[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0172, 0xFF29, 0x0080, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 37, -40 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_29[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE45, 0x0100, 0xFF80, 0xFF23 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 40, -43 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_30[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF0B, 0x008E, 0xFF72, 0xFF0B } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 50, -50 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_31[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFEEB, 0x00A0, 0xFF60, 0xFEEB } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 60, -59 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_32[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE8E, 0x00D6, 0xFF2A, 0xFE8E } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 70, -68 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_33[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFEEB, 0x00A0, 0xFF60, 0xFEEB } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 81, -78 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_34[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF0B, 0x008E, 0xFF72, 0xFF0B } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 91, -87 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_35[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE8E, 0x00D6, 0xFF80, 0xFF23 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, 96, -90 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_36[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0172, 0xFF29, 0x0080, 0x00DD } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 93, -82 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_37[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00C3, 0xFF5B, 0x00A5, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 88, -77 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_38[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00C3, 0xFF5B, 0x00A5, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 83, -66 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_39[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00C3, 0xFF5B, 0x00A5, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 74, -52 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxAlacaliburOBJ_Back_40[] __attribute__((section(".rodata.dat_data_banim_p89"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00C3, 0xFF5B, 0x00A5, 0x00C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, 65, -40 } } },
    ANIM_SPRITE_END,
};
