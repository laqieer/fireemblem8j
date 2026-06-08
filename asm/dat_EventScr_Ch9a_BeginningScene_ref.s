	.section .rodata.dat_EventScr_Ch9a_BeginningScene_ref, "a", %progbits
@ EventScr_Ch9a_BeginningScene: region-different data, JP 0x08a65aa0 read from funcmap-aligned code literal (US 0x089f396c); incbin baserom.gba
	.global EventScr_Ch9a_BeginningScene
EventScr_Ch9a_BeginningScene:
	.incbin "baserom.gba", 0xA65AA0, 0x2C8
