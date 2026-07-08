@ byte-neutral SPLIT of data_0890F2E0 (320 B) into 5 named sub-objects.
@ Excluded mirror (DATA_INCBIN_ASM_EXCLUDE): NOT linked, only text-scanned
@ by the named-symbols metric. Real bytes come from the src .c object;
@ make compare is the oracle.

	.section .data.residue.0890F2E0, "a", %progbits
	.global UnitDef_Ch13AEnemy_4
UnitDef_Ch13AEnemy_4:
	.incbin "data/residual/data_0890F2E0.bin", 0x0, 0x3C
	.section .data.residue.0890F31C, "a", %progbits
	.global UnitDef_Ch13AEnemy_5
UnitDef_Ch13AEnemy_5:
	.incbin "data/residual/data_0890F2E0.bin", 0x3C, 0x3C
	.section .data.residue.0890F358, "a", %progbits
	.global UnitDef_Ch13AEnemy_6
UnitDef_Ch13AEnemy_6:
	.incbin "data/residual/data_0890F2E0.bin", 0x78, 0x50
	.section .data.residue.0890F3A8, "a", %progbits
	.global UnitDef_Ch13AEnemy_7
UnitDef_Ch13AEnemy_7:
	.incbin "data/residual/data_0890F2E0.bin", 0xC8, 0x3C
	.section .data.residue.0890F3E4, "a", %progbits
	.global UnitDef_Ch13AEnemy_8
UnitDef_Ch13AEnemy_8:
	.incbin "data/residual/data_0890F2E0.bin", 0x104, 0x3C
