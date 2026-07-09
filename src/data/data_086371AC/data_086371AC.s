/* data_086371AC (battle-anim / effect pointer table), de-pointered from data/residual/data_086371AC.bin.
 * 100 words: 99 embedded 0x08xxxxxx pointers resolve to NAMED globals and are
 * emitted as relocatable .4byte Sym(+addend) (ROM stays SHIFTABLE); the remaining
 * 1 inline-data words stay raw .4byte. Byte-identical to baserom (make compare);
 * self-verified against the original .bin before wiring. Supersedes the raw INCBIN
 * and the dead asm/data_086371AC.s (excluded via DATA_INCBIN_ASM_EXCLUDE). */
	.section .data.residue.086371AC, "aw", %progbits
	.global data_086371AC
data_086371AC:
	.4byte dat_AnimSprite_08636294_ref + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, dat_AnimSprite_08636294_ref + 0x19, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_3 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_4 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_5 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_6 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_3 + 0x1, AnimSprite_EfxThunderstormOBJ_7 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_4 + 0x1, AnimSprite_EfxThunderstormOBJ_8 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_5 + 0x1, AnimSprite_EfxThunderstormOBJ_9 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_6 + 0x1, AnimSprite_EfxThunderstormOBJ_10 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_7 + 0x1, AnimSprite_EfxThunderstormOBJ_11 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_7 + 0x1, AnimSprite_EfxThunderstormOBJ_12 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_8 + 0x1, AnimSprite_EfxThunderstormOBJ_13 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_9 + 0x1, AnimSprite_EfxThunderstormOBJ_14 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_10 + 0x1, AnimSprite_EfxThunderstormOBJ_15 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_11 + 0x1, AnimSprite_EfxThunderstormOBJ_16 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_12 + 0x1, AnimSprite_EfxThunderstormOBJ_17 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_13 + 0x1, AnimSprite_EfxThunderstormOBJ_18 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_14 + 0x1, AnimSprite_EfxThunderstormOBJ_20 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_15 + 0x1, AnimSprite_EfxThunderstormOBJ_21 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_16 + 0x1, AnimSprite_EfxThunderstormOBJ_22 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_17 + 0x1, AnimSprite_EfxThunderstormOBJ_23 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_18 + 0x1, AnimSprite_EfxThunderstormOBJ_24 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_25 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_20 + 0x1, AnimSprite_EfxThunderstormOBJ_26 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_21 + 0x1, AnimSprite_EfxThunderstormOBJ_27 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_22 + 0x1, AnimSprite_EfxThunderstormOBJ_28 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_23 + 0x1, AnimSprite_EfxThunderstormOBJ_29 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_24 + 0x1, AnimSprite_EfxThunderstormOBJ_30 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_25 + 0x1, AnimSprite_EfxThunderstormOBJ_31 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_26 + 0x1, AnimSprite_EfxThunderstormOBJ_32 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x1, AnimSprite_EfxThunderstormOBJ_27 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x2, AnimSprite_EfxThunderstormOBJ_28 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_19 + 0x2, AnimSprite_EfxThunderstormOBJ_29 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x2, AnimSprite_EfxThunderstormOBJ_30 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x2, AnimSprite_EfxThunderstormOBJ_31 + 0x1
	.4byte AnimSprite_EfxThunderstormOBJ_19 + 0x2, AnimSprite_EfxThunderstormOBJ_32 + 0x1, AnimSprite_EfxThunderstormOBJ_19 + 0x2, 0x80000000
