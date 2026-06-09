	.section .rodata.dat_EventScr_Ch6_2_ref, "a", %progbits
@ EventScr_Ch6_2: region-different data, JP 0x08a64c18 read from funcmap-aligned code literal (US 0x089f2ae4); incbin baserom.gba
	.global EventScr_Ch6_2
EventScr_Ch6_2:
	.incbin "baserom.gba", 0xA64C18, 0x70
