	.section .rodata.dat_EventScr_Ch12A_5_ref, "a", %progbits
@ EventScr_Ch12A_5: region-different data, JP 0x08a67618 read from funcmap-aligned code literal (US 0x089f54e4); incbin baserom.gba
	.global EventScr_Ch12A_5
EventScr_Ch12A_5:
	.incbin "baserom.gba", 0xA67618, 0x48
