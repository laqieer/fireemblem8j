	.section .rodata.dat_voicegroup031_ref, "a", %progbits
@ voicegroup031: region-different data, JP 0x0820189c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global voicegroup031
voicegroup031:
	.incbin "baserom.gba", 0x20189C, 0x420
