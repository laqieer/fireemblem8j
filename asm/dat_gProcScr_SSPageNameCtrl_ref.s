	.section .rodata.dat_gProcScr_SSPageNameCtrl_ref, "a", %progbits
@ gProcScr_SSPageNameCtrl: region-different data, JP 0x08a729f0; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_SSPageNameCtrl
gProcScr_SSPageNameCtrl:
	.incbin "baserom.gba", 0xA729F0, 0x40
