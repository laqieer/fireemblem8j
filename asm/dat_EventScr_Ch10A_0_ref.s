	.section .rodata.dat_EventScr_Ch10A_0_ref, "a", %progbits
@ EventScr_Ch10A_0: region-different data, JP 0x08a664d4 read from funcmap-aligned code literal (US 0x089f43a0); incbin baserom.gba
	.global EventScr_Ch10A_0
EventScr_Ch10A_0:
	.incbin "baserom.gba", 0xA664D4, 0x58
