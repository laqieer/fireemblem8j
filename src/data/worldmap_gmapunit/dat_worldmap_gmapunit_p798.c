#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p798.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u16 Img_EfxArrowOBJ[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) = INCBIN_U16("graphics/gmapunit/Img_EfxArrowOBJ.bin.lz");
extern u8 AnimSprite_EfxArrowObj1[1] __attribute__((alias("Obj_EfxArrowOBJ")));
u8 Obj_EfxArrowOBJ[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) = INCBIN_U8("data/residual/Obj_EfxArrowOBJ.bin");
u8 AnimSprite_EfxArrowObj2[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) = INCBIN_U8("data/residual/AnimSprite_EfxArrowObj2.bin");
u8 AnimSprite_EfxArrowObj3[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) = INCBIN_U8("data/residual/AnimSprite_EfxArrowObj3.bin");
