	.section .rodata.dat_voicegroup046_ref, "a", %progbits
@ voicegroup046: region-different data, JP 0x08205cc4; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global voicegroup046
voicegroup046:
	.incbin "baserom.gba", 0x205CC4, 0x600
