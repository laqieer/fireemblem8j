	.section .rodata.dat_ProcScr_SioPostBattle_ref, "a", %progbits
@ ProcScr_SioPostBattle: region-different data, JP 0x085d3624; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_SioPostBattle
ProcScr_SioPostBattle:
	.incbin "baserom.gba", 0x5D3624, 0x58
