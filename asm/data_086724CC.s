@ byte-neutral SPLIT of data_086724CC into 3 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.086724CC, "a", %progbits
	.global Tsa_DivineBg_16
Tsa_DivineBg_16:
	.incbin "data/residual/data_086724CC.bin", 0x0, 0x9C
	.section .data.residue.08672568, "a", %progbits
	.global Tsa_DivineBg_17
Tsa_DivineBg_17:
	.incbin "data/residual/data_086724CC.bin", 0x9C, 0x9C
	.section .data.residue.08672604, "a", %progbits
	.global Tsa_DivineBg_18
Tsa_DivineBg_18:
	.incbin "data/residual/data_086724CC.bin", 0x138, 0x9C
