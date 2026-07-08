@ byte-neutral SPLIT of data_086AC554 into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.086AC554, "a", %progbits
	.global Tsa_SilenceBg_0
Tsa_SilenceBg_0:
	.incbin "data/residual/data_086AC554.bin", 0x0, 0xFC
	.section .data.residue.086AC650, "a", %progbits
	.global Tsa_SilenceBg_1
Tsa_SilenceBg_1:
	.incbin "data/residual/data_086AC554.bin", 0xFC, 0xE8
