	.section .rodata.dat_EventScr_Ch5x_BeginningScene_ref, "a", %progbits
@ EventScr_Ch5x_BeginningScene: region-different data, JP 0x08a64530 read from funcmap-aligned code literal (US 0x089f23fc); incbin baserom.gba
	.global EventScr_Ch5x_BeginningScene
EventScr_Ch5x_BeginningScene:
	.incbin "baserom.gba", 0xA64530, 0x200
