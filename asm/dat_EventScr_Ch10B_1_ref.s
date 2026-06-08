	.section .rodata.dat_EventScr_Ch10B_1_ref, "a", %progbits
@ EventScr_Ch10B_1: region-different data, JP 0x08a6cc5c read from funcmap-aligned code literal (US 0x089fab7c); incbin baserom.gba
	.global EventScr_Ch10B_1
EventScr_Ch10B_1:
	.incbin "baserom.gba", 0xA6CC5C, 0x54
