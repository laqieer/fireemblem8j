	.section .rodata.dat_gItemData_ref, "a", %progbits
@ gItemData: region-different data, JP 0x0885e068; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gItemData
gItemData:
	.incbin "data/residual/gItemData.bin"
