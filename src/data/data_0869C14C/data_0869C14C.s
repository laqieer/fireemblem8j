/* data_0869C14C (AnimSprite_EfxPurge_* effect-anim pointer table), de-pointered from data/residual/data_0869C14C.bin.
 * 28 words: 19 embedded 0x08xxxxxx pointers resolve to NAMED globals and are
 * emitted as relocatable .4byte Sym(+addend) (ROM stays SHIFTABLE); the remaining
 * 9 inline-data words stay raw .4byte. Byte-identical to baserom (make compare);
 * self-verified against the original .bin before wiring. Supersedes the raw INCBIN
 * and the dead asm/data_0869C14C.s (excluded via DATA_INCBIN_ASM_EXCLUDE). */
	.section .data.residue.0869C14C, "aw", %progbits
	.global data_0869C14C
data_0869C14C:
	.4byte 0x00000000, 0x0000001F, 0x0000FFF8, 0x00000001, 0x00000000, 0x00000000
	.4byte AnimSprite_EfxPurge_1 + 0x1, AnimSprite_EfxPurge_2 + 0x1, AnimSprite_EfxPurge_3 + 0x1, AnimSprite_EfxPurge_4 + 0x1, AnimSprite_EfxPurge_5 + 0x1, AnimSprite_EfxPurge_6 + 0x1
	.4byte AnimSprite_EfxPurge_7 + 0x1, AnimSprite_EfxPurge_8 + 0x1, AnimSprite_EfxPurge_9 + 0x1, data_0869BFF0 + 0x1, AnimSprite_EfxPurge_11 + 0x1, AnimSprite_EfxPurge_12 + 0x1
	.4byte AnimSprite_EfxPurge_13 + 0x1, AnimSprite_EfxPurge_14 + 0x1, AnimSprite_EfxPurge_15 + 0x1, AnimSprite_EfxPurge_16 + 0x1, AnimSprite_EfxPurge_17 + 0x1, AnimSprite_EfxPurge_18 + 0x1
	.4byte AnimSprite_EfxPurge_19 + 0x1, 0x7869C14F, 0x84000013, 0x80000000
