	.section .rodata.dat_gProcScr_BKSEL_ref, "a", %progbits
@ gProcScr_BKSEL: region-different data, JP 0x085c6a48; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_BKSEL
gProcScr_BKSEL:
	.incbin "baserom.gba", 0x5C6A48, 0x80
