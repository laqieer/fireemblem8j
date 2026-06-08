	.section .rodata.dat_EventScr_Ch1_BeginningScene_ref, "a", %progbits
@ EventScr_Ch1_BeginningScene: region-different data, JP 0x08a61980 read from funcmap-aligned code literal (US 0x089ef848); incbin baserom.gba
	.global EventScr_Ch1_BeginningScene
EventScr_Ch1_BeginningScene:
	.incbin "baserom.gba", 0xA61980, 0x1E0
