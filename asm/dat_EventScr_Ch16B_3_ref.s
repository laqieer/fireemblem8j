	.section .rodata.dat_EventScr_Ch16B_3_ref, "a", %progbits
@ EventScr_Ch16B_3: region-different data, JP 0x08a6eec0 read from funcmap-aligned code literal (US 0x089fce04); incbin baserom.gba
	.global EventScr_Ch16B_3
EventScr_Ch16B_3:
	.incbin "baserom.gba", 0xA6EEC0, 0x44
