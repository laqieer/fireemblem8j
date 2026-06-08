	.section .rodata.dat_gCharacterData_ref, "a", %progbits
@ gCharacterData: region-different data, JP 0x088582bc read from funcmap-aligned code literal (US 0x08803d64); incbin baserom.gba
	.global gCharacterData
gCharacterData:
	.incbin "baserom.gba", 0x8582BC, 0x3400
