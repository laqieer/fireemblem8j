	.section .rodata.dat_EventScr_Ch15B_22_ref, "a", %progbits
@ EventScr_Ch15B_22: region-different data, JP 0x08a6edb8 read from funcmap-aligned code literal (US 0x089fccfc); incbin baserom.gba
	.global EventScr_Ch15B_22
EventScr_Ch15B_22:
	.incbin "baserom.gba", 0xA6EDB8, 0x44
