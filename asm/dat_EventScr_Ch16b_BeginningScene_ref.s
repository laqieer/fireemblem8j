	.section .rodata.dat_EventScr_Ch16b_BeginningScene_ref, "a", %progbits
@ EventScr_Ch16b_BeginningScene: region-different data, JP 0x08a6ef80 read from funcmap-aligned code literal (US 0x089fcd40); incbin baserom.gba
	.global EventScr_Ch16b_BeginningScene
EventScr_Ch16b_BeginningScene:
	.incbin "baserom.gba", 0xA6EF80, 0x58
