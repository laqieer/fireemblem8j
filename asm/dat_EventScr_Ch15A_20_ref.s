	.section .rodata.dat_EventScr_Ch15A_20_ref, "a", %progbits
@ EventScr_Ch15A_20: region-different data, JP 0x08a68988 read from funcmap-aligned code literal (US 0x089f689c); incbin baserom.gba
	.global EventScr_Ch15A_20
EventScr_Ch15A_20:
	.incbin "baserom.gba", 0xA68988, 0x44
