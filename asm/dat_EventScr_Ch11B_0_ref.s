	.section .rodata.dat_EventScr_Ch11B_0_ref, "a", %progbits
@ EventScr_Ch11B_0: region-different data, JP 0x08a6d2c4 read from funcmap-aligned code literal (US 0x089fb1e4); incbin baserom.gba
	.global EventScr_Ch11B_0
EventScr_Ch11B_0:
	.incbin "baserom.gba", 0xA6D2C4, 0x6C
