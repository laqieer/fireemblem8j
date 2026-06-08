	.section .rodata.dat_gTsa_OpSubtitle_01_ref, "a", %progbits
@ gTsa_OpSubtitle_01: region-different data, JP 0x08b3e54c read from funcmap-aligned code literal (US 0x08aa5ee0); incbin baserom.gba
	.global gTsa_OpSubtitle_01
gTsa_OpSubtitle_01:
	.incbin "baserom.gba", 0xB3E54C, 0x13C
