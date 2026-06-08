	.section .rodata.dat_EventScr_Ch6_BeginningScene_ref, "a", %progbits
@ EventScr_Ch6_BeginningScene: region-different data, JP 0x08a6484c read from funcmap-aligned code literal (US 0x089f2718); incbin baserom.gba
	.global EventScr_Ch6_BeginningScene
EventScr_Ch6_BeginningScene:
	.incbin "baserom.gba", 0xA6484C, 0x228
