	.section .rodata.dat_ProcScr_WorldMapMain_ref, "a", %progbits
@ ProcScr_WorldMapMain: region-different data, JP 0x08ac1108; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_WorldMapMain
ProcScr_WorldMapMain:
	.incbin "baserom.gba", 0xAC1108, 0x5C0
