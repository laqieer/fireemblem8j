	.section .rodata.dat_gGameOptions_ref, "a", %progbits
@ gGameOptions: region-different data, JP 0x08aaf700; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gGameOptions
gGameOptions:
	.incbin "baserom.gba", 0xAAF700, 0x2EC
