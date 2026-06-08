	.section .rodata.dat_EventScr_Ch5_5_ref, "a", %progbits
@ EventScr_Ch5_5: region-different data, JP 0x08a643d8 read from funcmap-aligned code literal (US 0x089f22a4); incbin baserom.gba
	.global EventScr_Ch5_5
EventScr_Ch5_5:
	.incbin "baserom.gba", 0xA643D8, 0x48
