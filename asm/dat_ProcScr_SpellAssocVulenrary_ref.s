	.section .rodata.dat_ProcScr_SpellAssocVulenrary_ref, "a", %progbits
@ ProcScr_SpellAssocVulenrary: region-different data, JP 0x08a15084 read from funcmap-aligned code literal (US 0x089a49fc); incbin baserom.gba
	.global ProcScr_SpellAssocVulenrary
ProcScr_SpellAssocVulenrary:
	.incbin "baserom.gba", 0xA15084, 0x58
