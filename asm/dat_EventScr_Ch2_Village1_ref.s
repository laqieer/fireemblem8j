	.section .rodata.dat_EventScr_Ch2_Village1_ref, "a", %progbits
@ EventScr_Ch2_Village1: region-different data, JP 0x08a62788 read from funcmap-aligned code literal (US 0x089f0650); incbin baserom.gba
	.global EventScr_Ch2_Village1
EventScr_Ch2_Village1:
	.incbin "baserom.gba", 0xA62788, 0x80
