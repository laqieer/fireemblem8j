@ byte-neutral SPLIT of data_08908354 UnitDef residue (100 B, region-same) into
@ 2 named UnitDefinition arrays. Excluded mirror (DATA_INCBIN_ASM_EXCLUDE): NOT
@ linked, only text-scanned by the named-symbols metric. make compare is oracle.

	.section .data.residue.08908354, "a", %progbits
	.global UnitDef_Event_PrologueMessager
UnitDef_Event_PrologueMessager:
	.incbin "data/residual/data_08908354.bin", 0x0, 0x28
	.section .data.residue.0890837C, "a", %progbits
	.global UnitDef_Event_PrologueGradoRoyals
UnitDef_Event_PrologueGradoRoyals:
	.incbin "data/residual/data_08908354.bin", 0x28, 0x3C
