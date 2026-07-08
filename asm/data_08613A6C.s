@ byte-neutral SPLIT of data_08613A6C into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08613A6C, "a", %progbits
	.global Tsa_DarkBreathBg_10
Tsa_DarkBreathBg_10:
	.incbin "data/residual/data_08613A6C.bin", 0x0, 0xFC
	.section .data.residue.08613B68, "a", %progbits
	.global Tsa_DarkBreathBg_11
Tsa_DarkBreathBg_11:
	.incbin "data/residual/data_08613A6C.bin", 0xFC, 0x98
