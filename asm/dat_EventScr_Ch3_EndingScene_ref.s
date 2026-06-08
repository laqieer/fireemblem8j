	.section .rodata.dat_EventScr_Ch3_EndingScene_ref, "a", %progbits
@ EventScr_Ch3_EndingScene: region-different data, JP 0x08a63500 read from funcmap-aligned code literal (US 0x089f13cc); incbin baserom.gba
	.global EventScr_Ch3_EndingScene
EventScr_Ch3_EndingScene:
	.incbin "baserom.gba", 0xA63500, 0x19C
