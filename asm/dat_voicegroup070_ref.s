	.section .rodata.dat_voicegroup070_ref, "a", %progbits
@ voicegroup070: region-different data, JP 0x0820e6e8; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global voicegroup070
voicegroup070:
	.incbin "baserom.gba", 0x20E6E8, 0x600
