	.section .rodata.dat_EventScr_Ch14A_0_ref, "a", %progbits
@ EventScr_Ch14A_0: region-different data, JP 0x08a67df8 read from funcmap-aligned code literal (US 0x089f5cc4); incbin baserom.gba
	.global EventScr_Ch14A_0
EventScr_Ch14A_0:
	.incbin "baserom.gba", 0xA67DF8, 0xF4
