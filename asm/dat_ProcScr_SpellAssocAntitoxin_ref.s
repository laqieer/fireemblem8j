	.section .rodata.dat_ProcScr_SpellAssocAntitoxin_ref, "a", %progbits
@ ProcScr_SpellAssocAntitoxin: region-different data, JP 0x08a14f9c read from funcmap-aligned code literal (US 0x089a4914); incbin baserom.gba
	.global ProcScr_SpellAssocAntitoxin
ProcScr_SpellAssocAntitoxin:
	.incbin "baserom.gba", 0xA14F9C, 0x48
