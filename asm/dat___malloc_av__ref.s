	.section .rodata.dat___malloc_av__ref, "a", %progbits
@ __malloc_av_: region-different data, JP 0x08bb8a8c; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global __malloc_av_
__malloc_av_:
	.incbin "data/residual/__malloc_av_.bin"
