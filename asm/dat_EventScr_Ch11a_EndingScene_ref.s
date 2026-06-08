	.section .rodata.dat_EventScr_Ch11a_EndingScene_ref, "a", %progbits
@ EventScr_Ch11a_EndingScene: region-different data, JP 0x08a66bb0 read from funcmap-aligned code literal (US 0x089f4a7c); incbin baserom.gba
	.global EventScr_Ch11a_EndingScene
EventScr_Ch11a_EndingScene:
	.incbin "baserom.gba", 0xA66BB0, 0x3D8
