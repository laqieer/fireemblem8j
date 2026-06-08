	.section .rodata.dat_gItemData_ref, "a", %progbits
@ gItemData: region-different data, JP 0x0885e068 read from funcmap-aligned code literal (US 0x08809b10); incbin baserom.gba
	.global gItemData
gItemData:
	.incbin "baserom.gba", 0x85E068, 0x1CF8
