	.section .rodata.dat_EventScr_Ch10a_BeginningScene_ref, "a", %progbits
@ EventScr_Ch10a_BeginningScene: region-different data, JP 0x08a662d0 read from funcmap-aligned code literal (US 0x089f419c); incbin baserom.gba
	.global EventScr_Ch10a_BeginningScene
EventScr_Ch10a_BeginningScene:
	.incbin "baserom.gba", 0xA662D0, 0x204
