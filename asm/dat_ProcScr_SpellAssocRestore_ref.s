	.section .rodata.dat_ProcScr_SpellAssocRestore_ref, "a", %progbits
@ ProcScr_SpellAssocRestore: region-different data, JP 0x08a155cc read from funcmap-aligned code literal (US 0x089a4f44); incbin baserom.gba
	.global ProcScr_SpellAssocRestore
ProcScr_SpellAssocRestore:
	.incbin "baserom.gba", 0xA155CC, 0x88
