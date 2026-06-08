	.section .rodata.dat_EventScr_Ch15A_23_ref, "a", %progbits
@ EventScr_Ch15A_23: region-different data, JP 0x08a68a54 read from funcmap-aligned code literal (US 0x089f6968); incbin baserom.gba
	.global EventScr_Ch15A_23
EventScr_Ch15A_23:
	.incbin "baserom.gba", 0xA68A54, 0x44
