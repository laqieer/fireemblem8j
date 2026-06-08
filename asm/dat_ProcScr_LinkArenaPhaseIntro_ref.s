	.section .rodata.dat_ProcScr_LinkArenaPhaseIntro_ref, "a", %progbits
@ ProcScr_LinkArenaPhaseIntro: region-different data, JP 0x085d4c0c read from funcmap-aligned code literal (US 0x085aab68); incbin baserom.gba
	.global ProcScr_LinkArenaPhaseIntro
ProcScr_LinkArenaPhaseIntro:
	.incbin "baserom.gba", 0x5D4C0C, 0x50
