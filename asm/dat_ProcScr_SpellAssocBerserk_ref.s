	.section .rodata.dat_ProcScr_SpellAssocBerserk_ref, "a", %progbits
@ ProcScr_SpellAssocBerserk: region-different data, JP 0x08a1534c read from funcmap-aligned code literal (US 0x089a4cc4); incbin baserom.gba
	.global ProcScr_SpellAssocBerserk
ProcScr_SpellAssocBerserk:
	.incbin "baserom.gba", 0xA1534C, 0xA0
