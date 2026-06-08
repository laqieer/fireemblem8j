	.section .rodata.dat_ProcScr_SpellAssocMend_ref, "a", %progbits
@ ProcScr_SpellAssocMend: region-different data, JP 0x08a15144 read from funcmap-aligned code literal (US 0x089a4abc); incbin baserom.gba
	.global ProcScr_SpellAssocMend
ProcScr_SpellAssocMend:
	.incbin "baserom.gba", 0xA15144, 0x68
