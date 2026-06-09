	.section .rodata.dat_gCharacterData_ref, "a", %progbits
@ gCharacterData: region-different data, JP 0x088582bc; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gCharacterData
gCharacterData:
	.incbin "baserom.gba", 0x8582BC, 0x3400
