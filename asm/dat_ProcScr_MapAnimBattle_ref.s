	.section .rodata.dat_ProcScr_MapAnimBattle_ref, "a", %progbits
@ ProcScr_MapAnimBattle: region-different data, JP 0x08a13b90 read from funcmap-aligned code literal (US 0x089a3508); incbin baserom.gba
	.global ProcScr_MapAnimBattle
ProcScr_MapAnimBattle:
	.incbin "baserom.gba", 0xA13B90, 0xA8
