	.section .rodata.dat_ProcScr_SpellAssocMonsterStone_ref, "a", %progbits
@ ProcScr_SpellAssocMonsterStone: region-different data, JP 0x08a1548c read from funcmap-aligned code literal (US 0x089a4e04); incbin baserom.gba
	.global ProcScr_SpellAssocMonsterStone
ProcScr_SpellAssocMonsterStone:
	.incbin "baserom.gba", 0xA1548C, 0xA0
