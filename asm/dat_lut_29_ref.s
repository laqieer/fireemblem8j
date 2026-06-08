	.section .rodata.dat_lut_29_ref, "a", %progbits
@ lut.29: region-different data, JP 0x085c6690 read from funcmap-aligned code literal (US 0x0859e1b0); incbin baserom.gba
	.global lut.29
lut.29:
	.incbin "baserom.gba", 0x5C6690, 0xE0
