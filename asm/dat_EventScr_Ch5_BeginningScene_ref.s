	.section .rodata.dat_EventScr_Ch5_BeginningScene_ref, "a", %progbits
@ EventScr_Ch5_BeginningScene: region-different data, JP 0x08a63e5c read from funcmap-aligned code literal (US 0x089f1d28); incbin baserom.gba
	.global EventScr_Ch5_BeginningScene
EventScr_Ch5_BeginningScene:
	.incbin "baserom.gba", 0xA63E5C, 0x368
