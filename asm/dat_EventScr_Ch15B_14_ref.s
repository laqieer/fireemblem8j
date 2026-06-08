	.section .rodata.dat_EventScr_Ch15B_14_ref, "a", %progbits
@ EventScr_Ch15B_14: region-different data, JP 0x08a6eb98 read from funcmap-aligned code literal (US 0x089fcadc); incbin baserom.gba
	.global EventScr_Ch15B_14
EventScr_Ch15B_14:
	.incbin "baserom.gba", 0xA6EB98, 0x44
