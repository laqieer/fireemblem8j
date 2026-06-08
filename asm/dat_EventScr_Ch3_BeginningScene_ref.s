	.section .rodata.dat_EventScr_Ch3_BeginningScene_ref, "a", %progbits
@ EventScr_Ch3_BeginningScene: region-different data, JP 0x08a63334 read from funcmap-aligned code literal (US 0x089f1200); incbin baserom.gba
	.global EventScr_Ch3_BeginningScene
EventScr_Ch3_BeginningScene:
	.incbin "baserom.gba", 0xA63334, 0x14C
