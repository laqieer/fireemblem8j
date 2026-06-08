	.section .rodata.dat_gProcScr_ArenaUiResults_ref, "a", %progbits
@ gProcScr_ArenaUiResults: region-different data, JP 0x08abcc34 read from funcmap-aligned code literal (US 0x08a3963c); incbin baserom.gba
	.global gProcScr_ArenaUiResults
gProcScr_ArenaUiResults:
	.incbin "baserom.gba", 0xABCC34, 0xF0
