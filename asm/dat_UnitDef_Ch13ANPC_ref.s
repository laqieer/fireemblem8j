	.section .rodata.dat_UnitDef_Ch13ANPC_ref, "a", %progbits
@ UnitDef_Ch13ANPC: region-different data, JP 0x0890f5d8 read from funcmap-aligned code literal (US 0x088bb078); incbin baserom.gba
	.global UnitDef_Ch13ANPC
UnitDef_Ch13ANPC:
	.incbin "baserom.gba", 0x90F5D8, 0xA0
