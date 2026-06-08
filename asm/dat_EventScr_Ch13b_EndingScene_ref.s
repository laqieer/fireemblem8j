	.section .rodata.dat_EventScr_Ch13b_EndingScene_ref, "a", %progbits
@ EventScr_Ch13b_EndingScene: region-different data, JP 0x08a6dcec read from funcmap-aligned code literal (US 0x089fbc0c); incbin baserom.gba
	.global EventScr_Ch13b_EndingScene
EventScr_Ch13b_EndingScene:
	.incbin "baserom.gba", 0xA6DCEC, 0x80
