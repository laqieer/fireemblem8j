/* data_086730D0 (AnimSprite_EfxDevineOBJ_* effect-anim pointer table), de-pointered from data/residual/data_086730D0.bin.
 * 22 words: 14 embedded 0x08xxxxxx pointers resolve to NAMED globals and are
 * emitted as relocatable .4byte Sym(+addend) (ROM stays SHIFTABLE); the remaining
 * 8 inline-data words stay raw .4byte. Byte-identical to baserom (make compare);
 * self-verified against the original .bin before wiring. Supersedes the raw INCBIN
 * and its removed asm/data_086730D0.s mirror. */
	.include "animscr.inc"

	.section .data.residue.086730D0, "aw", %progbits
	.global data_086730D0
	.type data_086730D0, %object
data_086730D0:
	.4byte 0x00000000, 0x00000000, 0x0000FFF8, 0x00000001, 0x00000000, 0x00000000
	.global AnimScr_EfxDevineOBJ
	.type AnimScr_EfxDevineOBJ, %object
AnimScr_EfxDevineOBJ:
	ANIMSCR_FORCE_SPRITE data_086730D0, 29
	.4byte AnimSprite_EfxDevineOBJ_1 + 0x1, AnimSprite_EfxDevineOBJ_2 + 0x1, AnimSprite_EfxDevineOBJ_3 + 0x1, AnimSprite_EfxDevineOBJ_4 + 0x1, AnimSprite_EfxDevineOBJ_5 + 0x1
	.4byte AnimSprite_EfxDevineOBJ_6 + 0x1, AnimSprite_EfxDevineOBJ_7 + 0x1, AnimSprite_EfxDevineOBJ_8 + 0x1, AnimSprite_EfxDevineOBJ_9 + 0x1, AnimSprite_EfxDevineOBJ_10 + 0x1, AnimSprite_EfxDevineOBJ_11 + 0x1
	.4byte AnimSprite_EfxDevineOBJ_12 + 0x1, AnimSprite_EfxDevineOBJ_13 + 0x1, AnimSprite_EfxDevineOBJ_14 + 0x1, 0x80000000
