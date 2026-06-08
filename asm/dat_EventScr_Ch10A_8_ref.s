	.section .rodata.dat_EventScr_Ch10A_8_ref, "a", %progbits
@ EventScr_Ch10A_8: region-different data, JP 0x08a66884 read from funcmap-aligned code literal (US 0x089f4750); incbin baserom.gba
	.global EventScr_Ch10A_8
EventScr_Ch10A_8:
	.incbin "baserom.gba", 0xA66884, 0x58
