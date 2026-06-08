	.section .rodata.dat_gClassReelData_ref, "a", %progbits
@ gClassReelData: region-different data, JP 0x08ab031c read from funcmap-aligned code literal (US 0x08a2f6c0); incbin baserom.gba
	.global gClassReelData
gClassReelData:
	.incbin "baserom.gba", 0xAB031C, 0x514
