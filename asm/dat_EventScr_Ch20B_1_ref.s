	.section .rodata.dat_EventScr_Ch20B_1_ref, "a", %progbits
@ EventScr_Ch20B_1: region-different data, JP 0x08a6fb04 read from funcmap-aligned code literal (US 0x089fd630); incbin baserom.gba
	.global EventScr_Ch20B_1
EventScr_Ch20B_1:
	.incbin "baserom.gba", 0xA6FB04, 0x44
