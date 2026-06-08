	.section .rodata.dat_EventScr_Ch9a_EndingScene_ref, "a", %progbits
@ EventScr_Ch9a_EndingScene: region-different data, JP 0x08a65eec read from funcmap-aligned code literal (US 0x089f3db8); incbin baserom.gba
	.global EventScr_Ch9a_EndingScene
EventScr_Ch9a_EndingScene:
	.incbin "baserom.gba", 0xA65EEC, 0x194
