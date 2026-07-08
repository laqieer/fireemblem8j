@ byte-neutral SPLIT of data_085C4830 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.085C4830, "a", %progbits
	.global gConvoyMenuItems
gConvoyMenuItems:
	.incbin "data/residual/data_085C4830.bin", 0x0, 0xFC
	.section .data.residue.085C492C, "a", %progbits
	.global gSendToConvoyMenuItems
gSendToConvoyMenuItems:
	.incbin "data/residual/data_085C4830.bin", 0xFC, 0xFC
