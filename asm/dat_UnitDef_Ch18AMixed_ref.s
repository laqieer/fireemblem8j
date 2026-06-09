	.section .rodata.dat_UnitDef_Ch18AMixed_ref, "a", %progbits
@ UnitDef_Ch18AMixed: region-different data, JP 0x0891382c read from funcmap-aligned code literal (US 0x088bf330); incbin baserom.gba
	.global UnitDef_Ch18AMixed
UnitDef_Ch18AMixed:
	.incbin "baserom.gba", 0x91382C, 0xA0
