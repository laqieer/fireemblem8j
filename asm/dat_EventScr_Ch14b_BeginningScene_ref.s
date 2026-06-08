	.section .rodata.dat_EventScr_Ch14b_BeginningScene_ref, "a", %progbits
@ EventScr_Ch14b_BeginningScene: region-different data, JP 0x08a6e820 read from funcmap-aligned code literal (US 0x089fbe7c); incbin baserom.gba
	.global EventScr_Ch14b_BeginningScene
EventScr_Ch14b_BeginningScene:
	.incbin "baserom.gba", 0xA6E820, 0x18C
