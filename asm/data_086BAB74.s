@ byte-neutral SPLIT of data_086BAB74 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.086BAB74, "a", %progbits
	.global Tsa_BarrierBg_0
Tsa_BarrierBg_0:
	.incbin "data/residual/data_086BAB74.bin", 0x0, 0xB8
	.section .data.residue.086BAC2C, "a", %progbits
	.global Tsa_BarrierBg_1
Tsa_BarrierBg_1:
	.incbin "data/residual/data_086BAB74.bin", 0xB8, 0xC4
