	.section .rodata.dat_UnitDef_Ch21BMixed_ref, "a", %progbits
@ UnitDef_Ch21BMixed: region-different data, JP 0x0891fa68 read from funcmap-aligned code literal (US 0x088cb614); incbin baserom.gba
	.global UnitDef_Ch21BMixed
UnitDef_Ch21BMixed:
	.incbin "baserom.gba", 0x91FA68, 0x8C
