#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

/* Migrated from asm/dat_banim_ekrdragonfx_0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Img_EfxDracoZombie[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Img_EfxDracoZombie.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Tsa_EfxDracoZombieBaseLeft[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Tsa_EfxDracoZombieBaseLeft.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Tsa_EfxDracoZombieBaseRight[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Tsa_EfxDracoZombieBaseRight.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Tsa_EfxDracoZombie2[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Tsa_EfxDracoZombie2.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Tsa_EfxDracoZombie3[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Tsa_EfxDracoZombie3.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Tsa_EfxDracoZombie4[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Tsa_EfxDracoZombie4.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Tsa_EfxDracoZombie5[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Tsa_EfxDracoZombie5.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Tsa_EfxDracoZombie1[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Tsa_EfxDracoZombie1.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Pal_EfxDracoZombie[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Pal_EfxDracoZombie.gbapal");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Pal_Ekrdragonfx_0[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Pal_08791D7C.gbapal");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Img_Ekrdragonfx[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Img_08791D9C.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_0") u16 Pal_Ekrdragonfx_1[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Pal_08792194.gbapal");
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_1[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -24, -8 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_2[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -24, -10 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 0, -24 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_3[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -24, -12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 0, -26 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -16, -40 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_4[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, -24, -13 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 0, -28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -16, -42 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_5[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 16, -24 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, 0, -29 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -16, -44 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_6[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 16, -26 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, -16, -45 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_7[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 16, -28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 8, -48 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_8[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, 16, -29 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 8, -50 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_9[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 8, -52 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_10[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, 8, -53 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_11[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -16, -56 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_12[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -16, -55 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 0, -48 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_13[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -16, -53 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 0, -47 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 16, -32 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_14[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, -16, -51 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 0, -45 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 16, -31 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -8, -24 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_15[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, 0, -43 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 16, -29 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -8, -23 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, -24, -20 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_16[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, 16, -27 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -8, -21 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, -24, -19 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 0, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_17[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, -8, -19 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, -24, -17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 0, -15 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0000, 16, -12 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_18[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, -24, -15 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 0, -13 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 16, -11 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_19[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, 0, -11 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 16, -9 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_20[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0003, 16, -7 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_21[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -20, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 12, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -4, 12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -4, -20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -16, -16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -16, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 8, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 8, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_22[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -28, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 20, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -4, 20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -4, -28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -20, -20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -20, 12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 12, 12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 12, -20 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_23[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -32, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 24, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -4, 24 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -4, -32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -23, -23 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, -23, 15 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 15, 15 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0004, 15, -23 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_24[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -4, -34 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -4, 26 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -25, 17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 17, 17 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -25, -25 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -34, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 17, -25 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 26, -4 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_25[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -4, -36 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -4, 28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -26, 18 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 18, 18 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -26, -26 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -36, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 18, -26 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 28, -4 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_26[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -4, -37 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -4, 29 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -27, 19 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 19, 19 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -27, -27 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, -37, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 19, -27 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0005, 29, -4 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_27[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -28, -28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -38, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -28, 20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -4, 30 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 20, -28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -4, -38 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 30, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 20, 20 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_28[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -29, -29 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -39, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -29, 21 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -4, 31 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 21, -29 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -4, -39 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 31, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 21, 21 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_29[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -30, -30 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -40, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -30, 22 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -4, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 22, -30 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, -4, -40 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 32, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 22, 22 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_30[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, -4, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, -4, -40 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, -30, -30 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, 22, -30 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, -40, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, -30, 22 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, 32, -4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, 22, 22 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_0") struct AnimSpriteData AnimSprite_EfxClasschgObjDrop_31[] =
{
    ANIM_SPRITE_END,
};
