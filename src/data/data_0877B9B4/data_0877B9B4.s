/* data_0877B9B4 (pointer table (mixed pointers + inline data)), de-pointered from data/residual/data_0877B9B4.bin.
 * 81 words: 20 embedded 0x08xxxxxx pointers resolve to NAMED globals and are
 * emitted as relocatable .4byte Sym(+addend) (ROM stays SHIFTABLE); the remaining
 * 61 inline-data words stay raw .4byte. Byte-identical to baserom (make compare);
 * self-verified against the original .bin before wiring. Supersedes the raw INCBIN
 * and its removed asm/data_0877B9B4.s mirror. */
	.section .data.residue.0877B9B4, "aw", %progbits
	.global data_0877B9B4
data_0877B9B4:
	.4byte 0x80008000, 0xFFFC0020, 0x0000FFF0, 0x40008000, 0x000C0022, 0x0000FFF0
	.4byte 0x00000000, 0x00030000, 0x0000FFE8, 0x00000001, 0x00000000, 0x00000000
	.4byte 0x80008000, 0xFFF40020, 0x0000FFF0, 0x40008000, 0x00040022, 0x0000FFF0
	.4byte 0x00000000, 0xFFFB0000, 0x0000FFE8, 0x00000001, 0x00000000, 0x00000000
	.4byte AnimSprite_EfxChill_R_1 + 0x1, AnimSprite_EfxChill_R_2 + 0x1, AnimSprite_EfxChill_R_1 + 0x1, AnimSprite_EfxChill_R_2 + 0x31, AnimSprite_EfxChill_R_1 + 0x1, AnimSprite_EfxChill_R_4 + 0x1
	.4byte AnimSprite_EfxChill_R_1 + 0x1, AnimSprite_EfxChill_R_5 + 0x1, data_0877B9B4 + 0x1, AnimSprite_EfxChill_R_6 + 0x1, data_0877B9B4 + 0x31, AnimSprite_EfxChill_R_7 + 0x1
	.4byte data_0877B9B4 + 0x1, AnimSprite_EfxChill_R_4 + 0x1, AnimSprite_EfxChill_R_1 + 0x1, AnimSprite_EfxChill_R_5 + 0x1, AnimSprite_EfxChill_R_1 + 0x1, AnimSprite_EfxChill_R_2 + 0x1
	.4byte AnimSprite_EfxChill_R_1 + 0x1, AnimSprite_EfxChill_R_2 + 0x31, 0x80000000, 0x90008000, 0xFFF80020, 0x0000FFF0
	.4byte 0x50008000, 0xFFF00022, 0x0000FFF0, 0x10000000, 0xFFF90000, 0x0000FFE8
	.4byte 0x00000001, 0x00000000, 0x00000000, 0x90008000, 0xFFF40020, 0x0000FFF0
	.4byte 0x50008000, 0xFFEC0022, 0x0000FFF0, 0x10000000, 0xFFF50000, 0x0000FFE8
	.4byte 0x00000001, 0x00000000, 0x00000000, 0x90008000, 0xFFFC0020, 0x0000FFF0
	.4byte 0x50008000, 0xFFF40022, 0x0000FFF0, 0x10000000, 0xFFFD0000, 0x0000FFE8
	.4byte 0x00000001, 0x00000000, 0x00000000
