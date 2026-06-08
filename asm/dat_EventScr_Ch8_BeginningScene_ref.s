	.section .rodata.dat_EventScr_Ch8_BeginningScene_ref, "a", %progbits
@ EventScr_Ch8_BeginningScene: region-different data, JP 0x08a6506c read from funcmap-aligned code literal (US 0x089f2f38); incbin baserom.gba
	.global EventScr_Ch8_BeginningScene
EventScr_Ch8_BeginningScene:
	.incbin "baserom.gba", 0xA6506C, 0x1EC
