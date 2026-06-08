	.section .rodata.dat_bldyLut_10_ref, "a", %progbits
@ bldyLut.10: region-different data, JP 0x085c6646 read from funcmap-aligned code literal (US 0x0859e166); incbin baserom.gba
	.global bldyLut.10
bldyLut.10:
	.incbin "baserom.gba", 0x5C6646, 0x4A
