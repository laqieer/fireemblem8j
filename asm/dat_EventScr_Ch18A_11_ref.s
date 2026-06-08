	.section .rodata.dat_EventScr_Ch18A_11_ref, "a", %progbits
@ EventScr_Ch18A_11: region-different data, JP 0x08a69f50 read from funcmap-aligned code literal (US 0x089f7e6c); incbin baserom.gba
	.global EventScr_Ch18A_11
EventScr_Ch18A_11:
	.incbin "baserom.gba", 0xA69F50, 0x11C
