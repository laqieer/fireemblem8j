@ byte-neutral SPLIT of data_085F13A8 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.085F13A8, "a", %progbits
	.global AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_15
AnimSprite_EfxLvupOBJ2_EfxLvupOBJ_15:
	.incbin "data/residual/data_085F13A8.bin", 0x0, 0x6C
	.section .data.residue.085F1414, "a", %progbits
	.global AnimScr_EfxLvupOBJ2
AnimScr_EfxLvupOBJ2:
	.incbin "data/residual/data_085F13A8.bin", 0x6C, 0x44
