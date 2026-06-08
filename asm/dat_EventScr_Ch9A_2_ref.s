	.section .rodata.dat_EventScr_Ch9A_2_ref, "a", %progbits
@ EventScr_Ch9A_2: region-different data, JP 0x08a660d0 read from funcmap-aligned code literal (US 0x089f3f9c); incbin baserom.gba
	.global EventScr_Ch9A_2
EventScr_Ch9A_2:
	.incbin "baserom.gba", 0xA660D0, 0x40
