#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p20.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p20") u16 Img_BreathSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/FireBreathSprites.4bpp.lz");
SECTION(".rodata.dat_data_banim_p20") u16 Pal_FireBreathSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/FireBreathSprites.gbapal");
SECTION(".rodata.dat_data_banim_p20") u16 Img_EfxHurtmutEff00OBJ1[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/005DE984_Img_EfxHurtmutEff00OBJ1.4bpp.lz");
SECTION(".rodata.dat_data_banim_p20") u16 Img_EfxHurtmutEff00OBJ2[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/005DF224_Img_EfxHurtmutEff00OBJ2.4bpp.lz");
SECTION(".rodata.dat_data_banim_p20") u16 Pal_EfxHurtmutEff00OBJ[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/005DE984_Img_EfxHurtmutEff00OBJ1.gbapal");
SECTION(".rodata.dat_data_banim_p20") u16 Pal_IceBreathSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/IceBreathSprites.gbapal");
SECTION(".rodata.dat_data_banim_p20") u16 Pal_DarkBreathSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/DarkBreathSprites.gbapal");
SECTION(".rodata.dat_data_banim_p20") u16 Pal_WretchedAirSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/WretchedAirSprites.gbapal");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left1[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0464, -4, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left2[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0400, -8, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left3[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0402, -12, -12 } } },
    { .header = 0x00008000, .as = { .object = { 0x0404, 4, -12 } } },
    { .header = 0x00004000, .as = { .object = { 0x0442, -12, 4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0444, 4, 4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0464, -23, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left4[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0405, -16, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0400, -28, -4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0464, 0, -24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 20, 4 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p20") u8 AnimSprite_EfxBindingBlade_Left5[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Left5.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left6[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, 12, -4 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 28, -4 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 12, 12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 28, 12 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -8, -35 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 8, -35 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -8, -19 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 8, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -38, -12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p20") u8 AnimSprite_EfxBindingBlade_Left7[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Left7.4bpp");
SECTION(".rodata.dat_data_banim_p20") u8 AnimSprite_EfxBindingBlade_Left8[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Left8.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left9[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 8, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 16, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 32, -8 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 16, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 32, 8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0411, -38, -12 } } },
    { .header = 0x80000000, .as = { .object = { 0x040D, -12, -40 } } },
    { .header = 0x80000100, .as = { .object = { 0x0005, -36, -60 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -60, -4 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -44, -4 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -60, 12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -44, 12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -16, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left10[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 8, -8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, 12, -12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0411, -12, -40 } } },
    { .header = 0x80000000, .as = { .object = { 0x0415, -38, -12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 8, -56 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -36, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 20, -20 } } },
    { .header = 0x82000100, .as = { .object = { 0x0009, -64, -8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -16, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left11[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 32, 0 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 8, -8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0419, -39, -12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0415, -12, -41 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, -36, -60 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, 12, -12 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 4, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -28, -28 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 16, -24 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, -64, -8 } } },
    { .header = 0x80008000, .as = { .object = { 0x041D, -16, -16 } } },
    { .header = 0x40008000, .as = { .object = { 0x041F, 0, -16 } } },
    { .header = 0x00008000, .as = { .object = { 0x0440, 8, -16 } } },
    { .header = 0x00008000, .as = { .object = { 0x0441, 8, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left12[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 28, -4 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 44, -4 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 28, 12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 44, 12 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 12, -28 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 28, -28 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 12, -12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 28, -12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, 8, -8 } } },
    { .header = 0x80008000, .as = { .object = { 0x041D, -39, -12 } } },
    { .header = 0x40008000, .as = { .object = { 0x041F, -23, -12 } } },
    { .header = 0x00008000, .as = { .object = { 0x0440, -15, -12 } } },
    { .header = 0x00008000, .as = { .object = { 0x0441, -15, 4 } } },
    { .header = 0x80000000, .as = { .object = { 0x0419, -12, -43 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 0, -64 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 16, -64 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 0, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 16, -48 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, 12, -12 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -36, -60 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -32, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -12, -44 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -64, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left13[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 26, -8 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 8, -32 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -16, -48 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -4, -69 } } },
    { .header = 0x80008000, .as = { .object = { 0x041D, -12, -45 } } },
    { .header = 0x40008000, .as = { .object = { 0x041F, 4, -45 } } },
    { .header = 0x00008000, .as = { .object = { 0x0440, 12, -45 } } },
    { .header = 0x00008000, .as = { .object = { 0x0441, 12, -29 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, 12, -12 } } },
    { .header = 0x82000100, .as = { .object = { 0x0019, -36, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -16, -80 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 16, -36 } } },
    { .header = 0x82000100, .as = { .object = { 0x0005, -40, -40 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -64, -8 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p20") u8 AnimSprite_EfxBindingBlade_Left14[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Left14.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left15[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x80000100, .as = { .object = { 0x0005, 4, -48 } } },
    { .header = 0x82000100, .as = { .object = { 0x0015, 8, -32 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -24, -56 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, 12, -12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -4, -69 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -24, -88 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -8, -88 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -24, -72 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -8, -72 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, -40, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 8, -72 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 24, -72 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p20") u8 AnimSprite_EfxBindingBlade_Left16[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Left16.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left17[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -24, -56 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 0, -80 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 16, -80 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 0, -64 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 16, -64 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 16, -96 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -28, -92 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -4, -68 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, 4, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, 24, -72 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left18[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -24, -56 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -4, -84 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 12, -99 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 28, -99 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 12, -83 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 28, -83 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -28, -92 } } },
    { .header = 0x80008000, .as = { .object = { 0x041D, -4, -68 } } },
    { .header = 0x40008000, .as = { .object = { 0x041F, 12, -68 } } },
    { .header = 0x00008000, .as = { .object = { 0x0440, 20, -68 } } },
    { .header = 0x00008000, .as = { .object = { 0x0441, 20, -52 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, 4, -48 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left19[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0064, -8, -64 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, 8, -104 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -28, -93 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -4, -84 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -24, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left20[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, 8, -104 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, -8, -64 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -28, -93 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -4, -84 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -24, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left21[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0009, 8, -104 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -8, -64 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -28, -93 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -4, -84 } } },
    { .header = 0x80008000, .as = { .object = { 0x041D, -24, -56 } } },
    { .header = 0x40008000, .as = { .object = { 0x041F, -8, -56 } } },
    { .header = 0x00008000, .as = { .object = { 0x0440, 0, -56 } } },
    { .header = 0x00008000, .as = { .object = { 0x0441, 0, -40 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p20") u8 AnimSprite_EfxBindingBlade_Left22[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Left22.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left23[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0011, 8, -104 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -4, -84 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left24[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0015, 8, -104 } } },
    { .header = 0x80008000, .as = { .object = { 0x041D, -4, -84 } } },
    { .header = 0x40008000, .as = { .object = { 0x041F, 12, -84 } } },
    { .header = 0x00008000, .as = { .object = { 0x0440, 20, -84 } } },
    { .header = 0x00008000, .as = { .object = { 0x0441, 20, -68 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left25[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0019, 8, -104 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Left26[] __attribute__((section(".rodata.dat_data_banim_p20"))) =
{
    { .header = 0x80008000, .as = { .object = { 0x041D, 8, -104 } } },
    { .header = 0x40008000, .as = { .object = { 0x041F, 24, -104 } } },
    { .header = 0x00008000, .as = { .object = { 0x0440, 32, -104 } } },
    { .header = 0x00008000, .as = { .object = { 0x0441, 32, -88 } } },
    ANIM_SPRITE_END,
};
