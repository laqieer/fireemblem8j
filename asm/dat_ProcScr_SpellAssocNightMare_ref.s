	.section .rodata.dat_ProcScr_SpellAssocNightMare_ref, "a", %progbits
@ ProcScr_SpellAssocNightMare: region-different data, JP 0x08a14ea4 read from funcmap-aligned code literal (US 0x089a481c); incbin baserom.gba
	.global ProcScr_SpellAssocNightMare
ProcScr_SpellAssocNightMare:
	.incbin "baserom.gba", 0xA14EA4, 0x80
