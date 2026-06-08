	.section .rodata.dat_ProcScr_SpellAssocWarp_ref, "a", %progbits
@ ProcScr_SpellAssocWarp: region-different data, JP 0x08a1589c read from funcmap-aligned code literal (US 0x089a5214); incbin baserom.gba
	.global ProcScr_SpellAssocWarp
ProcScr_SpellAssocWarp:
	.incbin "baserom.gba", 0xA1589C, 0xE8
