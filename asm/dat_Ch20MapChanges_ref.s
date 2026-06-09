	.section .rodata.dat_Ch20MapChanges_ref, "a", %progbits
@ Ch20MapChanges: region-different data, JP 0x08a5c150; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global Ch20MapChanges
Ch20MapChanges:
	.incbin "baserom.gba", 0xA5C150, 0x10C
