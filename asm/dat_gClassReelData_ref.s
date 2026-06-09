	.section .rodata.dat_gClassReelData_ref, "a", %progbits
@ gClassReelData: region-different data, JP 0x08ab031c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gClassReelData
gClassReelData:
	.incbin "baserom.gba", 0xAB031C, 0x514
