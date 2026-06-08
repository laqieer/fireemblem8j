	.section .rodata.dat_EventScr_Ch10a_EndingScene_ref, "a", %progbits
@ EventScr_Ch10a_EndingScene: region-different data, JP 0x08a6652c read from funcmap-aligned code literal (US 0x089f43f8); incbin baserom.gba
	.global EventScr_Ch10a_EndingScene
EventScr_Ch10a_EndingScene:
	.incbin "baserom.gba", 0xA6652C, 0x23C
