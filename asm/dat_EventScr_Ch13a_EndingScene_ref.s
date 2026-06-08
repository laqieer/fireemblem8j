	.section .rodata.dat_EventScr_Ch13a_EndingScene_ref, "a", %progbits
@ EventScr_Ch13a_EndingScene: region-different data, JP 0x08a678cc read from funcmap-aligned code literal (US 0x089f5798); incbin baserom.gba
	.global EventScr_Ch13a_EndingScene
EventScr_Ch13a_EndingScene:
	.incbin "baserom.gba", 0xA678CC, 0x234
