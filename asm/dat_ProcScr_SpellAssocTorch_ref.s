	.section .rodata.dat_ProcScr_SpellAssocTorch_ref, "a", %progbits
@ ProcScr_SpellAssocTorch: region-different data, JP 0x08a1527c read from funcmap-aligned code literal (US 0x089a4bf4); incbin baserom.gba
	.global ProcScr_SpellAssocTorch
ProcScr_SpellAssocTorch:
	.incbin "baserom.gba", 0xA1527C, 0x48
