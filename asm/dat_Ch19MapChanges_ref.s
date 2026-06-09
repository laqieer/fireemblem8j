	.section .rodata.dat_Ch19MapChanges_ref, "a", %progbits
@ Ch19MapChanges: region-different data, JP 0x08a5c02c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global Ch19MapChanges
Ch19MapChanges:
	.incbin "baserom.gba", 0xA5C02C, 0x124
