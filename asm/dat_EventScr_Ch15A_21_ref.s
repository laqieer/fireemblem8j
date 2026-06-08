	.section .rodata.dat_EventScr_Ch15A_21_ref, "a", %progbits
@ EventScr_Ch15A_21: region-different data, JP 0x08a689cc read from funcmap-aligned code literal (US 0x089f68e0); incbin baserom.gba
	.global EventScr_Ch15A_21
EventScr_Ch15A_21:
	.incbin "baserom.gba", 0xA689CC, 0x44
