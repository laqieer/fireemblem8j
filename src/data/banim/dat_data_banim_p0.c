#include "global.h"

/* Migrated from asm/dat_data_banim_p0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u16 Img_TeonoOBJ[] __attribute__((section(".rodata.dat_data_banim_p0"))) = INCBIN_U16("graphics/banim/_us/efxmagic/Img_EfxTeonoOBJ.4bpp.lz");
u16 Pal_TeonoOBJ[] __attribute__((section(".rodata.dat_data_banim_p0"))) = INCBIN_U16("graphics/banim/_us/efxmagic/Img_EfxTeonoOBJ.gbapal", 0, 32);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoO\n"
"AnimSprite_EfxTeonoObj_TeonoO:\n"
"	.short 0x4000, 0x8000, 0x0008, -18, -4, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_0\n"
"AnimSprite_EfxTeonoObj_TeonoObj_0:\n"
"	.short 0x4000, 0x8000, 0x0000, -41, 1, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_1\n"
"AnimSprite_EfxTeonoObj_TeonoObj_1:\n"
"	.short 0x4000, 0x8000, 0x0004, -59, 3, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_2\n"
"AnimSprite_EfxTeonoObj_TeonoObj_2:\n"
"	.short 0x4000, 0x8000, 0x0008, -75, 3, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_3\n"
"AnimSprite_EfxTeonoObj_TeonoObj_3:\n"
"	.short 0x4000, 0x8000, 0x0000, -91, 3, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjCloseRight_0\n"
"AnimSprite_EfxTeonoObj_TeonoObjCloseRight_0:\n"
"	.short 0x4000, 0x8000, 0x0004, -101, -1, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjCloseRight_1\n"
"AnimSprite_EfxTeonoObj_TeonoObjCloseRight_1:\n"
"	.short 0x4000, 0x8000, 0x0008, -104, -4, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjCloseRight_2\n"
"AnimSprite_EfxTeonoObj_TeonoObjCloseRight_2:\n"
"	.short 0x4000, 0x8000, 0x0000, -110, -7, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjCloseRight_3\n"
"AnimSprite_EfxTeonoObj_TeonoObjCloseRight_3:\n"
"	.short 0x4000, 0x8000, 0x0004, -117, -10, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjCloseRight_4\n"
"AnimSprite_EfxTeonoObj_TeonoObjCloseRight_4:\n"
"	.short 0x4000, 0x8000, 0x0008, -121, -16, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjCloseRight_5\n"
"AnimSprite_EfxTeonoObj_TeonoObjCloseRight_5:\n"
"	.short 0x0000, 0x4000, 0x0040, -114, -18, 0\n"
"	.short 0x8000, 0x0000, 0x0042, -98, -18, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_0\n"
"AnimSprite_EfxTeonoObj_0:\n"
"	.short 0x4000, 0x0000, 0x0043, -109, -22, 0\n"
"	.short 0x0000, 0x0000, 0x0045, -93, -22, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_4\n"
"AnimSprite_EfxTeonoObj_TeonoObj_4:\n"
"	.short 0x4000, 0x0000, 0x0012, -101, -24, 0\n"
"	.short 0x0000, 0x0000, 0x0014, -85, -24, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_5\n"
"AnimSprite_EfxTeonoObj_TeonoObj_5:\n"
"	.short 0x4000, 0x0000, 0x000C, -94, -25, 0\n"
"	.short 0x0000, 0x0000, 0x000E, -78, -25, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_6\n"
"AnimSprite_EfxTeonoObj_TeonoObj_6:\n"
"	.short 0x4000, 0x0000, 0x000F, -83, -26, 0\n"
"	.short 0x0000, 0x0000, 0x0011, -67, -26, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_7\n"
"AnimSprite_EfxTeonoObj_TeonoObj_7:\n"
"	.short 0x4000, 0x0000, 0x0012, -72, -26, 0\n"
"	.short 0x0000, 0x0000, 0x0014, -56, -26, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_8\n"
"AnimSprite_EfxTeonoObj_TeonoObj_8:\n"
"	.short 0x4000, 0x0000, 0x000C, -56, -26, 0\n"
"	.short 0x0000, 0x0000, 0x000E, -40, -26, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_9\n"
"AnimSprite_EfxTeonoObj_TeonoObj_9:\n"
"	.short 0x4000, 0x0000, 0x000F, -46, -26, 0\n"
"	.short 0x0000, 0x0000, 0x0011, -30, -26, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_10\n"
"AnimSprite_EfxTeonoObj_TeonoObj_10:\n"
"	.short 0x4000, 0x0000, 0x0012, -33, -25, 0\n"
"	.short 0x0000, 0x0000, 0x0014, -17, -25, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_11\n"
"AnimSprite_EfxTeonoObj_TeonoObj_11:\n"
"	.short 0x4000, 0x0000, 0x0046, -22, -21, 0\n"
"	.short 0x0000, 0x0000, 0x0048, -6, -21, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_12\n"
"AnimSprite_EfxTeonoObj_TeonoObj_12:\n"
"	.short 0x0000, 0x4000, 0x0049, -9, -18, 0\n"
"	.short 0x8000, 0x0000, 0x004B, 7, -18, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj_13\n"
"AnimSprite_EfxTeonoObj_TeonoObj_13:\n"
"	.short 0x4000, 0x8000, 0x0008, -5, -10, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjFarRight_0\n"
"AnimSprite_EfxTeonoObj_TeonoObjFarRight_0:\n"
"	.short 0x4000, 0x8000, 0x0000, -106, 1, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObjFarRight_1\n"
"AnimSprite_EfxTeonoObj_TeonoObjFarRight_1:\n"
"	.short 0x4000, 0x8000, 0x0000, -127, -3, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
__asm__(
"	.section .rodata.dat_data_banim_p0, \"a\", %progbits\n"
"	.global AnimSprite_EfxTeonoObj_TeonoObj2Right\n"
"AnimSprite_EfxTeonoObj_TeonoObj2Right:\n"
"	.short 0x4000, 0x0000, 0x0043, -126, -18, 0\n"
"	.short 0x0000, 0x0000, 0x0045, -110, -18, 0\n"
"	.short 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
