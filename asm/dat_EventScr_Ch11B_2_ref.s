	.section .rodata.dat_EventScr_Ch11B_2_ref, "a", %progbits
@ EventScr_Ch11B_2: region-different data, JP 0x08a6d374 read from funcmap-aligned code literal (US 0x089fb294); incbin baserom.gba
	.global EventScr_Ch11B_2
EventScr_Ch11B_2:
	.incbin "baserom.gba", 0xA6D374, 0x84
