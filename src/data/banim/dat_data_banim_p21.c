#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p21.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxBindingBlade_Right1[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x10000000, .as = { .object = { 0x0464, -4, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right2[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0400, -8, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right3[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0402, -4, -12 } } },
    { .header = 0x10008000, .as = { .object = { 0x0404, -12, -12 } } },
    { .header = 0x10004000, .as = { .object = { 0x0442, -4, 4 } } },
    { .header = 0x10000000, .as = { .object = { 0x0444, -12, 4 } } },
    { .header = 0x10000000, .as = { .object = { 0x0464, 15, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right4[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0405, -16, -16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0400, 12, -4 } } },
    { .header = 0x10000000, .as = { .object = { 0x0464, -8, -24 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -28, 4 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p21") u8 AnimSprite_EfxBindingBlade_Right5[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Right5.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right6[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0002, -28, -4 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -36, -4 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -28, 12 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -36, 12 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -8, -35 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -16, -35 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -8, -19 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -16, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 6, -12 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p21") u8 AnimSprite_EfxBindingBlade_Right7[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Right7.4bpp");
SECTION(".rodata.dat_data_banim_p21") u8 AnimSprite_EfxBindingBlade_Right8[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Right8.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right9[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -16, -8 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -32, -8 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -40, -8 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -32, 8 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -40, 8 } } },
    { .header = 0x90000000, .as = { .object = { 0x0411, 6, -12 } } },
    { .header = 0x90000000, .as = { .object = { 0x040D, -20, -40 } } },
    { .header = 0x80000100, .as = { .object = { 0x0005, 4, -60 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 44, -4 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 36, -4 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 44, 12 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 36, 12 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, -16, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right10[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -16, -8 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, -44, -12 } } },
    { .header = 0x90000000, .as = { .object = { 0x0411, -20, -40 } } },
    { .header = 0x90000000, .as = { .object = { 0x0415, 6, -12 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -16, -56 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 4, -60 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -28, -20 } } },
    { .header = 0x82000100, .as = { .object = { 0x0009, 32, -8 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, -16, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right11[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -48, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -16, -8 } } },
    { .header = 0x90000000, .as = { .object = { 0x0419, 7, -12 } } },
    { .header = 0x90000000, .as = { .object = { 0x0415, -20, -41 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, 4, -60 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, -44, -12 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -20, -60 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 20, -28 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -32, -24 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, 32, -8 } } },
    { .header = 0x90008000, .as = { .object = { 0x041D, 0, -16 } } },
    { .header = 0x50008000, .as = { .object = { 0x041F, -8, -16 } } },
    { .header = 0x10008000, .as = { .object = { 0x0440, -16, -16 } } },
    { .header = 0x10008000, .as = { .object = { 0x0441, -16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right12[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -44, -4 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -52, -4 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -44, 12 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -52, 12 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -28, -28 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -36, -28 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -28, -12 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -36, -12 } } },
    { .header = 0x10000000, .as = { .object = { 0x0062, -16, -8 } } },
    { .header = 0x90008000, .as = { .object = { 0x041D, 23, -12 } } },
    { .header = 0x50008000, .as = { .object = { 0x041F, 15, -12 } } },
    { .header = 0x10008000, .as = { .object = { 0x0440, 7, -12 } } },
    { .header = 0x10008000, .as = { .object = { 0x0441, 7, 4 } } },
    { .header = 0x90000000, .as = { .object = { 0x0419, -20, -43 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -16, -64 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -24, -64 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -16, -48 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -24, -48 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, -44, -12 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, 4, -60 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 16, -32 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 4, -44 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, 32, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right13[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -58, -8 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -40, -32 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 0, -48 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, -28, -69 } } },
    { .header = 0x90008000, .as = { .object = { 0x041D, -4, -45 } } },
    { .header = 0x50008000, .as = { .object = { 0x041F, -12, -45 } } },
    { .header = 0x10008000, .as = { .object = { 0x0440, -20, -45 } } },
    { .header = 0x10008000, .as = { .object = { 0x0441, -20, -29 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, -44, -12 } } },
    { .header = 0x82000100, .as = { .object = { 0x0019, 4, -60 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 8, -80 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -24, -36 } } },
    { .header = 0x82000100, .as = { .object = { 0x0005, 8, -40 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, 32, -8 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p21") u8 AnimSprite_EfxBindingBlade_Right14[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Right14.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right15[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x80000100, .as = { .object = { 0x0005, -36, -48 } } },
    { .header = 0x82000100, .as = { .object = { 0x0015, -40, -32 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, -8, -56 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, -44, -12 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, -28, -69 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 8, -88 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 0, -88 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 8, -72 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 0, -72 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, 8, -40 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -16, -72 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -32, -72 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p21") u8 AnimSprite_EfxBindingBlade_Right16[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Right16.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right17[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, -8, -56 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -16, -80 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -24, -80 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -16, -64 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -24, -64 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -32, -96 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, -4, -92 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, -28, -68 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, -36, -48 } } },
    { .header = 0x10000000, .as = { .object = { 0x0062, -32, -72 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right18[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, -8, -56 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, -28, -84 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -28, -99 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -36, -99 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -28, -83 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -36, -83 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, -4, -92 } } },
    { .header = 0x90008000, .as = { .object = { 0x041D, -12, -68 } } },
    { .header = 0x50008000, .as = { .object = { 0x041F, -20, -68 } } },
    { .header = 0x10008000, .as = { .object = { 0x0440, -28, -68 } } },
    { .header = 0x10008000, .as = { .object = { 0x0441, -28, -52 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, -36, -48 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right19[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x10000000, .as = { .object = { 0x0064, 0, -64 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, -40, -104 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, -4, -93 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, -28, -84 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, -8, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right20[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, -40, -104 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, 0, -64 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, -4, -93 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, -28, -84 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, -8, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right21[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0009, -40, -104 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 0, -64 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, -4, -93 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, -28, -84 } } },
    { .header = 0x90008000, .as = { .object = { 0x041D, 8, -56 } } },
    { .header = 0x50008000, .as = { .object = { 0x041F, 0, -56 } } },
    { .header = 0x10008000, .as = { .object = { 0x0440, -8, -56 } } },
    { .header = 0x10008000, .as = { .object = { 0x0441, -8, -40 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p21") u8 AnimSprite_EfxBindingBlade_Right22[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBindingBlade_Right22.4bpp");
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right23[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0011, -40, -104 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, -28, -84 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right24[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0015, -40, -104 } } },
    { .header = 0x90008000, .as = { .object = { 0x041D, -12, -84 } } },
    { .header = 0x50008000, .as = { .object = { 0x041F, -20, -84 } } },
    { .header = 0x10008000, .as = { .object = { 0x0440, -28, -84 } } },
    { .header = 0x10008000, .as = { .object = { 0x0441, -28, -68 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right25[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0019, -40, -104 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBindingBlade_Right26[] __attribute__((section(".rodata.dat_data_banim_p21"))) =
{
    { .header = 0x90008000, .as = { .object = { 0x041D, -24, -104 } } },
    { .header = 0x50008000, .as = { .object = { 0x041F, -32, -104 } } },
    { .header = 0x10008000, .as = { .object = { 0x0440, -40, -104 } } },
    { .header = 0x10008000, .as = { .object = { 0x0441, -40, -88 } } },
    ANIM_SPRITE_END,
};
