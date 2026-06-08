	.section .rodata.dat_EventScr_Ch14B_2_ref, "a", %progbits
@ EventScr_Ch14B_2: region-different data, JP 0x08a6e60c read from funcmap-aligned code literal (US 0x089fc52c); incbin baserom.gba
	.global EventScr_Ch14B_2
EventScr_Ch14B_2:
	.incbin "baserom.gba", 0xA6E60C, 0x74
