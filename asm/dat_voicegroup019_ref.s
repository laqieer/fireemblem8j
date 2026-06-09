	.section .rodata.dat_voicegroup019_ref, "a", %progbits
@ voicegroup019: region-different data, JP 0x081fdd20; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global voicegroup019
voicegroup019:
	.incbin "baserom.gba", 0x1FDD20, 0x600
