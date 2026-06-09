	.section .rodata.dat_gRedAiEscapePoints_ref, "a", %progbits
@ gRedAiEscapePoints: region-different data, JP 0x085d2090; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gRedAiEscapePoints
gRedAiEscapePoints:
	.incbin "baserom.gba", 0x5D2090, 0x104
