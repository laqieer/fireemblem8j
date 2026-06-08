	.section .rodata.dat_ProcScr_SpellAssocSilence_ref, "a", %progbits
@ ProcScr_SpellAssocSilence: region-different data, JP 0x08a1552c read from funcmap-aligned code literal (US 0x089a4ea4); incbin baserom.gba
	.global ProcScr_SpellAssocSilence
ProcScr_SpellAssocSilence:
	.incbin "baserom.gba", 0xA1552C, 0xA0
