@ byte-neutral SPLIT of data_085FC458 into 3 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.085FC458, "a", %progbits
	.global AnimScr_EkrBaseKaiten1
AnimScr_EkrBaseKaiten1:
	.incbin "data/residual/data_085FC458.bin", 0x0, 0x24
	.section .data.residue.085FC47C, "a", %progbits
	.global AnimScr_EkrBaseKaiten2
AnimScr_EkrBaseKaiten2:
	.incbin "data/residual/data_085FC458.bin", 0x24, 0x24
	.section .data.residue.085FC4A0, "a", %progbits
	.global AnimSprite_EkrBaseKaiten_10
AnimSprite_EkrBaseKaiten_10:
	.incbin "data/residual/data_085FC458.bin", 0x48, 0x24
