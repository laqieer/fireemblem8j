@ byte-neutral SPLIT of data_0890EB30 into 4 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.0890EB30, "a", %progbits
	.global UnitDef_Ch12AAlly_0
UnitDef_Ch12AAlly_0:
	.incbin "data/residual/data_0890EB30.bin", 0x0, 0x28
	.section .data.residue.0890EB58, "a", %progbits
	.global UnitDef_Ch12AAlly_1
UnitDef_Ch12AAlly_1:
	.incbin "data/residual/data_0890EB30.bin", 0x28, 0x78
	.section .data.residue.0890EBD0, "a", %progbits
	.global UnitDef_Ch12AMixed
UnitDef_Ch12AMixed:
	.incbin "data/residual/data_0890EB30.bin", 0xA0, 0x3C
	.section .data.residue.0890EC0C, "a", %progbits
	.global UnitDef_Ch12AEnemy_4
UnitDef_Ch12AEnemy_4:
	.incbin "data/residual/data_0890EB30.bin", 0xDC, 0x8C
