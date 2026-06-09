	.section .rodata.dat_gProcScr_ChapterIntroTitleOnly_ref, "a", %progbits
@ gProcScr_ChapterIntroTitleOnly: region-different data, JP 0x085c3a58; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global gProcScr_ChapterIntroTitleOnly
gProcScr_ChapterIntroTitleOnly:
	.incbin "baserom.gba", 0x5C3A58, 0x88
