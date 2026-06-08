	.section .rodata.dat_ProcScr_SpellAssocBarrier_ref, "a", %progbits
@ ProcScr_SpellAssocBarrier: region-different data, JP 0x08a15814 read from funcmap-aligned code literal (US 0x089a518c); incbin baserom.gba
	.global ProcScr_SpellAssocBarrier
ProcScr_SpellAssocBarrier:
	.incbin "baserom.gba", 0xA15814, 0x88
