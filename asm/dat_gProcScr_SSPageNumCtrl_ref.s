	.section .rodata.dat_gProcScr_SSPageNumCtrl_ref, "a", %progbits
@ gProcScr_SSPageNumCtrl: region-different data, JP 0x08a72a30; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_SSPageNumCtrl
gProcScr_SSPageNumCtrl:
	.incbin "baserom.gba", 0xA72A30, 0x50
