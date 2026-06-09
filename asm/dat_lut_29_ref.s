	.section .rodata.dat_lut_29_ref, "a", %progbits
@ lut.29: region-different data, JP 0x085c6690; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global lut.29
lut.29:
	.incbin "baserom.gba", 0x5C6690, 0xE0
