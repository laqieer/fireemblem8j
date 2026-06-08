	.section .rodata.dat_ProcScr_SpellAssocRecover_ref, "a", %progbits
@ ProcScr_SpellAssocRecover: region-different data, JP 0x08a151ac read from funcmap-aligned code literal (US 0x089a4b24); incbin baserom.gba
	.global ProcScr_SpellAssocRecover
ProcScr_SpellAssocRecover:
	.incbin "baserom.gba", 0xA151AC, 0x68
