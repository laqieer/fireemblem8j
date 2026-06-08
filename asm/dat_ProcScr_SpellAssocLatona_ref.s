	.section .rodata.dat_ProcScr_SpellAssocLatona_ref, "a", %progbits
@ ProcScr_SpellAssocLatona: region-different data, JP 0x08a14f24 read from funcmap-aligned code literal (US 0x089a489c); incbin baserom.gba
	.global ProcScr_SpellAssocLatona
ProcScr_SpellAssocLatona:
	.incbin "baserom.gba", 0xA14F24, 0x78
