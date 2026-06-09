	.section .rodata.dat_Ch16MapChanges_ref, "a", %progbits
@ Ch16MapChanges: region-different data, JP 0x08a5bc3c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global Ch16MapChanges
Ch16MapChanges:
	.incbin "baserom.gba", 0xA5BC3C, 0x19C
