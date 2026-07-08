#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u16 Img_TeonoOBJ[] __attribute__((section(".rodata.dat_data_banim_p0"))) = INCBIN_U16("graphics/banim/_us/efxmagic/Img_EfxTeonoOBJ.4bpp.lz");
u16 Pal_TeonoOBJ[] __attribute__((section(".rodata.dat_data_banim_p0"))) = INCBIN_U16("graphics/banim/_us/efxmagic/Img_EfxTeonoOBJ.gbapal", 0, 32);
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoO[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0008, -18, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_0[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0000, -41, 1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_1[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0004, -59, 3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_2[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0008, -75, 3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_3[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0000, -91, 3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_0[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0004, -101, -1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_1[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0008, -104, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_2[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0000, -110, -7 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_3[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0004, -117, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_4[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0008, -121, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_5[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0040, -114, -18 } } },
    { .header = 0x00008000, .as = { .object = { 0x0042, -98, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_0[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0043, -109, -22 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -93, -22 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_4[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0012, -101, -24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0014, -85, -24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_5[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x000C, -94, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x000E, -78, -25 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_6[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x000F, -83, -26 } } },
    { .header = 0x00000000, .as = { .object = { 0x0011, -67, -26 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_7[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0012, -72, -26 } } },
    { .header = 0x00000000, .as = { .object = { 0x0014, -56, -26 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_8[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x000C, -56, -26 } } },
    { .header = 0x00000000, .as = { .object = { 0x000E, -40, -26 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_9[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x000F, -46, -26 } } },
    { .header = 0x00000000, .as = { .object = { 0x0011, -30, -26 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_10[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0012, -33, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0014, -17, -25 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_11[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0046, -22, -21 } } },
    { .header = 0x00000000, .as = { .object = { 0x0048, -6, -21 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_12[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0049, -9, -18 } } },
    { .header = 0x00008000, .as = { .object = { 0x004B, 7, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_13[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0008, -5, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjFarRight_0[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0000, -106, 1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjFarRight_1[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0000, -127, -3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj2Right[] __attribute__((section(".rodata.dat_data_banim_p0"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0043, -126, -18 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -110, -18 } } },
    ANIM_SPRITE_END,
};
