	.section .rodata.dat_EventScr_Ch20B_2_ref, "a", %progbits
@ EventScr_Ch20B_2: region-different data, JP 0x08a6fb58 read from funcmap-aligned code literal (US 0x089fd674); incbin baserom.gba
	.global EventScr_Ch20B_2
EventScr_Ch20B_2:
	.incbin "baserom.gba", 0xA6FB58, 0x44
