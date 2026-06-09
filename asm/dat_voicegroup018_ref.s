	.section .rodata.dat_voicegroup018_ref, "a", %progbits
@ voicegroup018: region-different data, JP 0x081fd720; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global voicegroup018
voicegroup018:
	.incbin "baserom.gba", 0x1FD720, 0x600
