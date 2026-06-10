	.section .rodata.dat_gWMPathData_ref, "a", %progbits
@ gWMPathData: region-different data, JP 0x081f6340; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gWMPathData
gWMPathData:
	.incbin "data/residual/gWMPathData.bin"
