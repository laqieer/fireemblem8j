@ byte-neutral SPLIT of data_085FC638 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.085FC638, "a", %progbits
	.global AnimSprite_EkrBaseKaiten_14
AnimSprite_EkrBaseKaiten_14:
	.incbin "data/residual/data_085FC638.bin", 0x0, 0xB4
	.section .data.residue.085FC6EC, "a", %progbits
	.global AnimSprite_EkrBaseKaiten_15
AnimSprite_EkrBaseKaiten_15:
	.incbin "data/residual/data_085FC638.bin", 0xB4, 0xD8
