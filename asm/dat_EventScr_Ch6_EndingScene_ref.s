	.section .rodata.dat_EventScr_Ch6_EndingScene_ref, "a", %progbits
@ EventScr_Ch6_EndingScene: region-different data, JP 0x08a64b30 read from funcmap-aligned code literal (US 0x089f29fc); incbin baserom.gba
	.global EventScr_Ch6_EndingScene
EventScr_Ch6_EndingScene:
	.incbin "baserom.gba", 0xA64B30, 0x9C
