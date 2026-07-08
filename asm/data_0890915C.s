@ byte-neutral SPLIT of data_0890915C into 2 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.0890915C, "a", %progbits
	.global UnitDef_Ch4Ally_1
UnitDef_Ch4Ally_1:
	.incbin "data/residual/data_0890915C.bin", 0x0, 0x28
	.section .data.residue.08909184, "a", %progbits
	.global UnitDef_Ch4Ally_2
UnitDef_Ch4Ally_2:
	.incbin "data/residual/data_0890915C.bin", 0x28, 0x28
