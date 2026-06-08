	.section .rodata.dat_EventScr_Ch4_1_ref, "a", %progbits
@ EventScr_Ch4_1: region-different data, JP 0x08a63b2c read from funcmap-aligned code literal (US 0x089f19f8); incbin baserom.gba
	.global EventScr_Ch4_1
EventScr_Ch4_1:
	.incbin "baserom.gba", 0xA63B2C, 0x140
