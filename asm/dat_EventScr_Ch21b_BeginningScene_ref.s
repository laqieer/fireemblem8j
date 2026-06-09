	.section .rodata.dat_EventScr_Ch21b_BeginningScene_ref, "a", %progbits
@ EventScr_Ch21b_BeginningScene: region-different data, JP 0x08a6fc04 read from funcmap-aligned code literal (US 0x089fd974); incbin baserom.gba
	.global EventScr_Ch21b_BeginningScene
EventScr_Ch21b_BeginningScene:
	.incbin "baserom.gba", 0xA6FC04, 0x44
