	.section .rodata.dat_ProcScr_SpellAssocUnlock_ref, "a", %progbits
@ ProcScr_SpellAssocUnlock: region-different data, JP 0x08a152c4 read from funcmap-aligned code literal (US 0x089a4c3c); incbin baserom.gba
	.global ProcScr_SpellAssocUnlock
ProcScr_SpellAssocUnlock:
	.incbin "baserom.gba", 0xA152C4, 0x88
