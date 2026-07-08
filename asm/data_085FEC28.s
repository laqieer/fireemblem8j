@ byte-neutral SPLIT of data_085FEC28 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.085FEC28, "a", %progbits
	.global AnimSprite_EkrBaseKaiten_84
AnimSprite_EkrBaseKaiten_84:
	.incbin "data/residual/data_085FEC28.bin", 0x0, 0x78
	.section .data.residue.085FECA0, "a", %progbits
	.global AnimSprite_EkrBaseKaiten_85
AnimSprite_EkrBaseKaiten_85:
	.incbin "data/residual/data_085FEC28.bin", 0x78, 0x90
