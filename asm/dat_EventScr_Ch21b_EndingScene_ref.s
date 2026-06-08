	.section .rodata.dat_EventScr_Ch21b_EndingScene_ref, "a", %progbits
@ EventScr_Ch21b_EndingScene: region-different data, JP 0x08a6fa70 read from funcmap-aligned code literal (US 0x089fd9b8); incbin baserom.gba
	.global EventScr_Ch21b_EndingScene
EventScr_Ch21b_EndingScene:
	.incbin "baserom.gba", 0xA6FA70, 0x74
