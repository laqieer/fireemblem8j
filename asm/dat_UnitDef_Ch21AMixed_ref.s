	.section .rodata.dat_UnitDef_Ch21AMixed_ref, "a", %progbits
@ UnitDef_Ch21AMixed: region-different data, JP 0x08916330 read from funcmap-aligned code literal (US 0x088c1e48); incbin baserom.gba
	.global UnitDef_Ch21AMixed
UnitDef_Ch21AMixed:
	.incbin "baserom.gba", 0x916330, 0x8C
