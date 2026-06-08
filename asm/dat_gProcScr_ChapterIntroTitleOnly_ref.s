	.section .rodata.dat_gProcScr_ChapterIntroTitleOnly_ref, "a", %progbits
@ gProcScr_ChapterIntroTitleOnly: region-different data, JP 0x085c3a58 read from funcmap-aligned code literal (US 0x0859b578); incbin baserom.gba
	.global gProcScr_ChapterIntroTitleOnly
gProcScr_ChapterIntroTitleOnly:
	.incbin "baserom.gba", 0x5C3A58, 0x88
