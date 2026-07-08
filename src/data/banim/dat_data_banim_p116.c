#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p116.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p116") u16 Tsa_FenrirBg_47[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0065A964_Tsa_0865A964.map.bin.lz");
SECTION(".rodata.dat_data_banim_p116") u16 Tsa_FenrirBg_48[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0065ABBC_Tsa_0865ABBC.map.bin.lz");
SECTION(".rodata.dat_data_banim_p116") u16 Tsa_FenrirBg_49[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0065ADC4_Tsa_0865ADC4.map.bin.lz");
SECTION(".rodata.dat_data_banim_p116") u16 Img_FenrirSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/0065AF3C_Img_FenrirSprites.4bpp.lz");
SECTION(".rodata.dat_data_banim_p116") u16 Pal_FenrirSprites_A[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/0065BAB8_Pal_FenrirSprites_A.gbapal");
SECTION(".rodata.dat_data_banim_p116") u16 Pal_FenrirSprites_B[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/0065BAD8_Pal_FenrirSprites_B.gbapal");
struct AnimSpriteData AnimSprite_EfxFenrir_1[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -16, -32 } } },
    { .header = 0x80004000, .as = { .object = { 0x0012, -16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_2[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -16, -28 } } },
    { .header = 0x80004100, .as = { .object = { 0x0052, -16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_3[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x01AC, 0x0000, 0x0000, 0x01AC } } },
    { .header = 0x80000100, .as = { .object = { 0x0008, -16, -23 } } },
    { .header = 0x80004100, .as = { .object = { 0x0016, -16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_4[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0x80008000, .as = { .object = { 0x000C, -8, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_5[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x80008100, .as = { .object = { 0x000E, -8, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_6[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x01AC, 0x0000, 0x0000, 0x01AC } } },
    { .header = 0x80008100, .as = { .object = { 0x0010, -8, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_7[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0057, -8, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_8[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0505 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x0505 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFAFB } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFAFB } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -20 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -20 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -20 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -20 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -13 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -13 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -13 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -13 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_9[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x035E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x035E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFCA2 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFCA2 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -21 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -21 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -21 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -21 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -12 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -12 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -12 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_10[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0282 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x0282 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFD7E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFD7E } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -23 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -23 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -23 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -23 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -10 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -10 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -10 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_11[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFE00 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFE00 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -24 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -24 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -24 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -24 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -9 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -9 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -9 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_12[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x01AC } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x01AF } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFE51 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFE51 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -26 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -26 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -26 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -26 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -7 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -7 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -7 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -7 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_13[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFE92 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFE92 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -28 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -28 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -28 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -28 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -5 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -5 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -5 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -5 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_14[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFEBF } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFEBF } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -29 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -29 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -29 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -29 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -4 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -4 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -4 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_15[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x011C } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x011C } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xFEE4 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xFEE4 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -31 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -31 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -31 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -31 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -2 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -2 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -2 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -2 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_16[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x001A, -48, -32 } } },
    { .header = 0x80008000, .as = { .object = { 0x001E, -16, -32 } } },
    { .header = 0x90000000, .as = { .object = { 0x001A, 16, -32 } } },
    { .header = 0x90008000, .as = { .object = { 0x001E, 0, -32 } } },
    { .header = 0xA0000000, .as = { .object = { 0x001A, -48, 0 } } },
    { .header = 0xA0008000, .as = { .object = { 0x001E, -16, 0 } } },
    { .header = 0xB0000000, .as = { .object = { 0x001A, 16, 0 } } },
    { .header = 0xB0008000, .as = { .object = { 0x001E, 0, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_17[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0x0A3D } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0x0A3D } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0100, 0x0000, 0x0000, 0xF5C3 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFF00, 0x0000, 0x0000, 0xF5C3 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -48, -18 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -18 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 14, -18 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -18 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -48, -15 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -15 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 14, -15 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_18[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0282, 0x0000, 0x0000, 0x0282 } } },
    { .header = 0x80000100, .as = { .object = { 0x0000, -16, -18 } } },
    { .header = 0x80004100, .as = { .object = { 0x0012, -16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_19[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0505, 0x0000, 0x0000, 0x0505 } } },
    { .header = 0x80000100, .as = { .object = { 0x0004, -16, -13 } } },
    { .header = 0x80004100, .as = { .object = { 0x0052, -16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_20[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0282, 0x0000, 0x0000, 0x0282 } } },
    { .header = 0x80008100, .as = { .object = { 0x000C, -8, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_21[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0505, 0x0000, 0x0000, 0x0505 } } },
    { .header = 0x80008100, .as = { .object = { 0x000E, -8, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_22[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x011C, 0x0000, 0x0000, 0x011C } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFEE4, 0x0000, 0x0000, 0x011C } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x011C, 0x0000, 0x0000, 0xFEE4 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFEE4, 0x0000, 0x0000, 0xFEE4 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -46, -31 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -16, -31 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 13, -31 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -1, -31 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -46, -2 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -16, -2 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 13, -2 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -1, -2 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_23[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFEBF, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0xFEBF } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFEBF, 0x0000, 0x0000, 0xFEBF } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -42, -29 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -15, -29 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 9, -29 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -2, -29 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -42, -4 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -15, -4 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 9, -4 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -2, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_24[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0xFE92 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0xFE92 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -39, -28 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -14, -28 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 6, -28 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -3, -28 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -39, -5 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -14, -5 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 6, -5 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -3, -5 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_25[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x01AC, 0x0000, 0x0000, 0x01AC } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE51, 0x0000, 0x0000, 0x01AF } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x01AF, 0x0000, 0x0000, 0xFE51 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE51, 0x0000, 0x0000, 0xFE51 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -35, -26 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -13, -26 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, 2, -26 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -4, -26 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -35, -7 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -13, -7 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, 2, -7 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -4, -7 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_26[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0xFE00 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0xFE00 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -32, -24 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -12, -24 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, -1, -24 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -5, -24 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -32, -9 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -12, -9 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, -1, -9 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -5, -9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_27[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0282, 0x0000, 0x0000, 0x0282 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFD7E, 0x0000, 0x0000, 0x0282 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0282, 0x0000, 0x0000, 0xFD7E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFD7E, 0x0000, 0x0000, 0xFD7E } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -30, -23 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -12, -23 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, -3, -23 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -5, -23 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -30, -10 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -12, -10 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, -3, -10 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -5, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_28[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x035E, 0x0000, 0x0000, 0x035E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFCA2, 0x0000, 0x0000, 0x035E } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x035E, 0x0000, 0x0000, 0xFCA2 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFCA2, 0x0000, 0x0000, 0xFCA2 } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -26, -21 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -11, -21 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, -7, -21 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -6, -21 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -26, -12 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -11, -12 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, -7, -12 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -6, -12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_29[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0xFFFF0004, .as = { .affine = { 0x0505, 0x0000, 0x0000, 0x0505 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFAFB, 0x0000, 0x0000, 0x0505 } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0x0505, 0x0000, 0x0000, 0xFAFB } } },
    { .header = 0xFFFF0004, .as = { .affine = { 0xFAFB, 0x0000, 0x0000, 0xFAFB } } },
    { .header = 0x80000100, .as = { .object = { 0x001A, -23, -20 } } },
    { .header = 0x80008100, .as = { .object = { 0x001E, -10, -20 } } },
    { .header = 0x82000100, .as = { .object = { 0x001A, -10, -20 } } },
    { .header = 0x82008100, .as = { .object = { 0x001E, -7, -20 } } },
    { .header = 0x84000100, .as = { .object = { 0x001A, -23, -13 } } },
    { .header = 0x84008100, .as = { .object = { 0x001E, -10, -13 } } },
    { .header = 0x86000100, .as = { .object = { 0x001A, -10, -13 } } },
    { .header = 0x86008100, .as = { .object = { 0x001E, -7, -13 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFenrir_30[] __attribute__((section(".rodata.dat_data_banim_p116"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0079, 0, -8 } } },
    ANIM_SPRITE_END,
};
