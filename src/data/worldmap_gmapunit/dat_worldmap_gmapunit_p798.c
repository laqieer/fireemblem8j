#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p798.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u16 Img_EfxArrowOBJ[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) = INCBIN_U16("graphics/gmapunit/Img_EfxArrowOBJ.4bpp.lz");
extern u8 AnimSprite_EfxArrowObj1[1] __attribute__((alias("Obj_EfxArrowOBJ")));
/* Editable ANIM_SPRITE frame (was data/residual/Obj_EfxArrowOBJ.bin): one OBJ
 * frame of 2 sprites + ANIM_SPRITE_END, same .short form as the sibling
 * AnimSprite_EfxArrowObj2/3 below (cf fe8u Obj_EfxArrowOBJ in
 * src/data/banim/data_banim.s). Byte-identical, verified by `make compare`. */
const u16 Obj_EfxArrowOBJ[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) = {
    0x4000, 0x0000, 0x0000, 0xFFC3, 0xFFF2, 0x0000, 0x0000, 0x0000, 0x0002, 0xFFD3, 0xFFF2, 0x0000, 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};
struct AnimSpriteData AnimSprite_EfxArrowObj2[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0000, -93, -14 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -77, -14 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxArrowObj3[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0000, -125, -14 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -109, -14 } } },
    ANIM_SPRITE_END,
};
