	.section .rodata.dat_EventScr_Ch5x_EndingScene_ref, "a", %progbits
@ EventScr_Ch5x_EndingScene: region-different data, JP 0x08a64730 read from funcmap-aligned code literal (US 0x089f25fc); incbin baserom.gba
	.global EventScr_Ch5x_EndingScene
EventScr_Ch5x_EndingScene:
	.incbin "baserom.gba", 0xA64730, 0x11C
