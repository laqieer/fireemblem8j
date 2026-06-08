	.section .rodata.dat_ProcScr_SpellAssocRepair_ref, "a", %progbits
@ ProcScr_SpellAssocRepair: region-different data, JP 0x08a15654 read from funcmap-aligned code literal (US 0x089a4fcc); incbin baserom.gba
	.global ProcScr_SpellAssocRepair
ProcScr_SpellAssocRepair:
	.incbin "baserom.gba", 0xA15654, 0x88
