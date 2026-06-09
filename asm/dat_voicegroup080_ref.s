	.section .rodata.dat_voicegroup080_ref, "a", %progbits
@ voicegroup080: region-different data, JP 0x082125a0; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global voicegroup080
voicegroup080:
	.incbin "baserom.gba", 0x2125A0, 0x240
