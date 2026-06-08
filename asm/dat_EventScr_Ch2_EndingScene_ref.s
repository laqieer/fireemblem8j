	.section .rodata.dat_EventScr_Ch2_EndingScene_ref, "a", %progbits
@ EventScr_Ch2_EndingScene: region-different data, JP 0x08a625ec read from funcmap-aligned code literal (US 0x089f04b4); incbin baserom.gba
	.global EventScr_Ch2_EndingScene
EventScr_Ch2_EndingScene:
	.incbin "baserom.gba", 0xA625EC, 0x148
