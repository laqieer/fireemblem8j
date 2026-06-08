	.section .rodata.dat_ProcScr_SpellAssocElixir_ref, "a", %progbits
@ ProcScr_SpellAssocElixir: region-different data, JP 0x08a1502c read from funcmap-aligned code literal (US 0x089a49a4); incbin baserom.gba
	.global ProcScr_SpellAssocElixir
ProcScr_SpellAssocElixir:
	.incbin "baserom.gba", 0xA1502C, 0x58
