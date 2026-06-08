	.section .rodata.dat_EventScr_Ch7_BeginningScene_ref, "a", %progbits
@ EventScr_Ch7_BeginningScene: region-different data, JP 0x08a64cc0 read from funcmap-aligned code literal (US 0x089f2b8c); incbin baserom.gba
	.global EventScr_Ch7_BeginningScene
EventScr_Ch7_BeginningScene:
	.incbin "baserom.gba", 0xA64CC0, 0x170
