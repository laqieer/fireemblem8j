	.section .rodata.dat_impure_data_ref, "a", %progbits
@ impure_data: region-different data, JP 0x08bb8788; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global impure_data
impure_data:
	.incbin "baserom.gba", 0xBB8788, 0x2EC
