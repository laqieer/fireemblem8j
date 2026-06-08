	.section .rodata.dat_EventScr_Ch7_EndingScene_ref, "a", %progbits
@ EventScr_Ch7_EndingScene: region-different data, JP 0x08a64e5c read from funcmap-aligned code literal (US 0x089f2d28); incbin baserom.gba
	.global EventScr_Ch7_EndingScene
EventScr_Ch7_EndingScene:
	.incbin "baserom.gba", 0xA64E5C, 0x144
