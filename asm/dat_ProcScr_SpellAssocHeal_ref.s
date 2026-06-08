	.section .rodata.dat_ProcScr_SpellAssocHeal_ref, "a", %progbits
@ ProcScr_SpellAssocHeal: region-different data, JP 0x08a150dc read from funcmap-aligned code literal (US 0x089a4a54); incbin baserom.gba
	.global ProcScr_SpellAssocHeal
ProcScr_SpellAssocHeal:
	.incbin "baserom.gba", 0xA150DC, 0x68
