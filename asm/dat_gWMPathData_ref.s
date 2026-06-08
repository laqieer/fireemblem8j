	.section .rodata.dat_gWMPathData_ref, "a", %progbits
@ gWMPathData: region-different data, JP 0x081f6340 read from funcmap-aligned code literal (US 0x08206674); incbin baserom.gba
	.global gWMPathData
gWMPathData:
	.incbin "baserom.gba", 0x1F6340, 0x180
