	.section .rodata.dat_EventScr_Ch15B_20_ref, "a", %progbits
@ EventScr_Ch15B_20: region-different data, JP 0x08a6ed30 read from funcmap-aligned code literal (US 0x089fcc74); incbin baserom.gba
	.global EventScr_Ch15B_20
EventScr_Ch15B_20:
	.incbin "baserom.gba", 0xA6ED30, 0x44
