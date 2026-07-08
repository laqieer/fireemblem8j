@ byte-neutral SPLIT of data_0890F470 into 4 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.0890F470, "a", %progbits
	.global UnitDef_Ch13AEnemy_10
UnitDef_Ch13AEnemy_10:
	.incbin "data/residual/data_0890F470.bin", 0x0, 0x28
	.section .data.residue.0890F498, "a", %progbits
	.global UnitDef_Ch13AEnemy_11
UnitDef_Ch13AEnemy_11:
	.incbin "data/residual/data_0890F470.bin", 0x28, 0x28
	.section .data.residue.0890F4C0, "a", %progbits
	.global UnitDef_Ch13AAlly_0
UnitDef_Ch13AAlly_0:
	.incbin "data/residual/data_0890F470.bin", 0x50, 0x64
	.section .data.residue.0890F524, "a", %progbits
	.global UnitDef_Ch13AAlly_1
UnitDef_Ch13AAlly_1:
	.incbin "data/residual/data_0890F470.bin", 0xB4, 0xB4
