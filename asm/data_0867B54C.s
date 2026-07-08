@ byte-neutral SPLIT of data_0867B54C into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.0867B54C, "a", %progbits
	.global Tsa_EclipseBg_B
Tsa_EclipseBg_B:
	.incbin "data/residual/data_0867B54C.bin", 0x0, 0xA0
	.section .data.residue.0867B5EC, "a", %progbits
	.global Tsa_EclipseBg_C
Tsa_EclipseBg_C:
	.incbin "data/residual/data_0867B54C.bin", 0xA0, 0xA0
