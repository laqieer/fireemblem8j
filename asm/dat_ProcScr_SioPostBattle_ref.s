	.section .rodata.dat_ProcScr_SioPostBattle_ref, "a", %progbits
@ ProcScr_SioPostBattle: region-different data, JP 0x085d3624 read from funcmap-aligned code literal (US 0x085a971c); incbin baserom.gba
	.global ProcScr_SioPostBattle
ProcScr_SioPostBattle:
	.incbin "baserom.gba", 0x5D3624, 0x58
