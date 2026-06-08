	.section .rodata.dat_gTsa_OpSubtitle_00_ref, "a", %progbits
@ gTsa_OpSubtitle_00: region-different data, JP 0x08b3e378 read from funcmap-aligned code literal (US 0x08aa5c84); incbin baserom.gba
	.global gTsa_OpSubtitle_00
gTsa_OpSubtitle_00:
	.incbin "baserom.gba", 0xB3E378, 0x1D4
