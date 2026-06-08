	.section .rodata.dat_EventScr_Ch16B_5_ref, "a", %progbits
@ EventScr_Ch16B_5: region-different data, JP 0x08a6ef3c read from funcmap-aligned code literal (US 0x089fce80); incbin baserom.gba
	.global EventScr_Ch16B_5
EventScr_Ch16B_5:
	.incbin "baserom.gba", 0xA6EF3C, 0x44
