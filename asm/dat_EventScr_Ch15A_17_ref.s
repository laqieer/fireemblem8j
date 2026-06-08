	.section .rodata.dat_EventScr_Ch15A_17_ref, "a", %progbits
@ EventScr_Ch15A_17: region-different data, JP 0x08a688bc read from funcmap-aligned code literal (US 0x089f67d0); incbin baserom.gba
	.global EventScr_Ch15A_17
EventScr_Ch15A_17:
	.incbin "baserom.gba", 0xA688BC, 0x44
