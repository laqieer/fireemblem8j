	.section .rodata.dat_EventScr_Ch12B_1_ref, "a", %progbits
@ EventScr_Ch12B_1: region-different data, JP 0x08a6d758 read from funcmap-aligned code literal (US 0x089fb678); incbin baserom.gba
	.global EventScr_Ch12B_1
EventScr_Ch12B_1:
	.incbin "baserom.gba", 0xA6D758, 0xF8
