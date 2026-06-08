	.section .rodata.dat_ProcScr_SpellAssocPhysic_ref, "a", %progbits
@ ProcScr_SpellAssocPhysic: region-different data, JP 0x08a15214 read from funcmap-aligned code literal (US 0x089a4b8c); incbin baserom.gba
	.global ProcScr_SpellAssocPhysic
ProcScr_SpellAssocPhysic:
	.incbin "baserom.gba", 0xA15214, 0x68
