	.section .rodata.dat_gGreenAiEscapePoints_ref, "a", %progbits
@ gGreenAiEscapePoints: region-different data, JP 0x085d2194; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gGreenAiEscapePoints
gGreenAiEscapePoints:
	.incbin "baserom.gba", 0x5D2194, 0x104
