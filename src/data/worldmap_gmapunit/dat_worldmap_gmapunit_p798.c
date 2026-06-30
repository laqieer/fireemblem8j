#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p798.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u16 Img_EfxArrowOBJ[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p798"))) = INCBIN_U16("graphics/gmapunit/Img_EfxArrowOBJ.4bpp.lz");
extern u8 AnimSprite_EfxArrowObj1[1] __attribute__((alias("Obj_EfxArrowOBJ")));
/* Editable ANIM_SPRITE frame (was data/residual/Obj_EfxArrowOBJ.bin): one OBJ
 * frame of 2 sprites + ANIM_SPRITE_END, same .short form as the sibling
 * AnimSprite_EfxArrowObj2/3 below (cf fe8u Obj_EfxArrowOBJ in
 * src/data/banim/data_banim.s). Byte-identical, verified by `make compare`. */
__asm__(
"	.section .rodata.dat_worldmap_gmapunit_p798, \"a\", %progbits\n"
"	.global Obj_EfxArrowOBJ\n"
"Obj_EfxArrowOBJ:\n"
"	.short 0x4000, 0x0000, 0x0000, -61, -14, 0\n"
"	.short 0x0000, 0x0000, 0x0002, -45, -14, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_worldmap_gmapunit_p798, \"a\", %progbits\n"
"	.global AnimSprite_EfxArrowObj2\n"
"AnimSprite_EfxArrowObj2:\n"
"	.short 0x4000, 0x0000, 0x0000, -93, -14, 0\n"
"	.short 0x0000, 0x0000, 0x0002, -77, -14, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_worldmap_gmapunit_p798, \"a\", %progbits\n"
"	.global AnimSprite_EfxArrowObj3\n"
"AnimSprite_EfxArrowObj3:\n"
"	.short 0x4000, 0x0000, 0x0000, -125, -14, 0\n"
"	.short 0x0000, 0x0000, 0x0002, -109, -14, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
