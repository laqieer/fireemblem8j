	.section .rodata.dat_EventScr_Ch4_BeginningScene_ref, "a", %progbits
@ EventScr_Ch4_BeginningScene: region-different data, JP 0x08a638d8 read from funcmap-aligned code literal (US 0x089f17a4); incbin baserom.gba
	.global EventScr_Ch4_BeginningScene
EventScr_Ch4_BeginningScene:
	.incbin "baserom.gba", 0xA638D8, 0x1F8
