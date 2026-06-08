	.section .rodata.dat_ProcScr_WorldMapMain_ref, "a", %progbits
@ ProcScr_WorldMapMain: region-different data, JP 0x08ac1108 read from funcmap-aligned code literal (US 0x08a3d748); incbin baserom.gba
	.global ProcScr_WorldMapMain
ProcScr_WorldMapMain:
	.incbin "baserom.gba", 0xAC1108, 0x5C0
