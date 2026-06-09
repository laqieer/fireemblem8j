	.section .rodata.dat_voicegroup065_ref, "a", %progbits
@ voicegroup065: region-different data, JP 0x0820ca14; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global voicegroup065
voicegroup065:
	.incbin "baserom.gba", 0x20CA14, 0x4D4
