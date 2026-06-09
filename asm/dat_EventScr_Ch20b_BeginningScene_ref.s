	.section .rodata.dat_EventScr_Ch20b_BeginningScene_ref, "a", %progbits
@ EventScr_Ch20b_BeginningScene: region-different data, JP 0x08a6fa2c read from funcmap-aligned code literal (US 0x089fd51c); incbin baserom.gba
	.global EventScr_Ch20b_BeginningScene
EventScr_Ch20b_BeginningScene:
	.incbin "baserom.gba", 0xA6FA2C, 0x44
