	.section .rodata.dat_gMPlayTable_ref, "a", %progbits
@ gMPlayTable: region-different data, JP 0x082140b4; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gMPlayTable
gMPlayTable:
	.incbin "data/residual/gMPlayTable.bin"
