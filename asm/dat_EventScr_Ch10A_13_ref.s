	.section .rodata.dat_EventScr_Ch10A_13_ref, "a", %progbits
@ EventScr_Ch10A_13: region-different data, JP 0x08a6696c read from funcmap-aligned code literal (US 0x089f4838); incbin baserom.gba
	.global EventScr_Ch10A_13
EventScr_Ch10A_13:
	.incbin "baserom.gba", 0xA6696C, 0x94
