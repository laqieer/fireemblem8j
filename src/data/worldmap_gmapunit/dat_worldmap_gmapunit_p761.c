#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p761.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Img5_EfxLvupBG[] = INCBIN_U16("graphics/reuse/Img5_EfxLvupBG.4bpp.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Img6_EfxLvupBG[] = INCBIN_U16("graphics/reuse/Img6_EfxLvupBG.4bpp.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Img7_EfxLvupBG[] = INCBIN_U16("graphics/reuse/Img7_EfxLvupBG.4bpp.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Pal_EfxLvupBG[] = INCBIN_U16("graphics/gmapunit/Pal_EfxLvupBG.gbapal");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa1_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa1_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa2_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa2_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa3_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa3_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa4_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa4_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa5_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa5_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa6_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa6_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa7_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa7_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa8_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa8_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa9_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa9_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa10_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa10_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa11_EfxLvupBG[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa11_EfxLvupBG.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Img_EfxLvupBG2[] = INCBIN_U16("graphics/gmapunit/Img_EfxLvupBG2.4bpp.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Pal_EfxLvupBG2[] = INCBIN_U16("graphics/gmapunit/Pal_EfxLvupBG2.gbapal");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Pal_EfxLvupBGCOL[] = INCBIN_U16("graphics/gmapunit/Pal_EfxLvupBGCOL.gbapal");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa1_EfxLvupBG2[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa1_EfxLvupBG2.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa2_EfxLvupBG2[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa2_EfxLvupBG2.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa3_EfxLvupBG2[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa3_EfxLvupBG2.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa4_EfxLvupBG2[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa4_EfxLvupBG2.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa5_EfxLvupBG2[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa5_EfxLvupBG2.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Tsa6_EfxLvupBG2[] = INCBIN_U16("graphics/banim/efxlvupfx/Tsa6_EfxLvupBG2.map.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p761") u16 Img_EfxLvupOBJ2[] = INCBIN_U16("graphics/gmapunit/Img_EfxLvupOBJ2.4bpp.lz");
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_0[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80008000, .as = { .object = { 0x0002, -120, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -104, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -112, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -88, -40 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_1[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -120, -48 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -88, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -96, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -72, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -112, -24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_2[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -104, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -120, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -72, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -80, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -56, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -104, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -96, -24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_3[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -88, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -104, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -56, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -64, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -40, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -112, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -88, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -80, -24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_4[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -72, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -88, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -40, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -48, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -24, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -96, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -72, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -64, -24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_5[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -56, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -72, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -24, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -32, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -8, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -80, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -56, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -48, -24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_6[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -40, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -56, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -8, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -16, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 8, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -64, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -32, -24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -40, -48 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_7[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -24, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -40, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 8, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 0, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 24, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -48, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_8[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -8, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -24, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 24, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 16, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 40, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -32, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_9[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, 8, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, -8, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, 8, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 40, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 32, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 56, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, -16, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_10[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, 24, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 8, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 8, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 56, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 48, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 72, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 0, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_11[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, 40, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 24, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 8, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, 40, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 72, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 64, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 88, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 16, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_12[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, 56, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 40, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 8, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 40, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 88, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 80, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 104, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 32, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_13[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, 72, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 56, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 8, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 40, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, 72, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 104, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 96, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 48, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_14[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p761"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, 88, -48 } } },
    { .header = 0x40000000, .as = { .object = { 0x0024, 72, -40 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -120, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -88, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -56, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, -24, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 8, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 40, -36 } } },
    { .header = 0x40004000, .as = { .object = { 0x0004, 72, -36 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 112, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0026, 64, -32 } } },
    ANIM_SPRITE_END,
};
