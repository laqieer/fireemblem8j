	.section .rodata.dat_gUnitLookup_ref, "a", %progbits
@ gUnitLookup: region-different data, JP 0x085c2a50; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gUnitLookup
gUnitLookup:
	.incbin "data/residual/gUnitLookup.bin"
