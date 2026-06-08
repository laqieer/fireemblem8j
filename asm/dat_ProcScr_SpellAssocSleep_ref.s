	.section .rodata.dat_ProcScr_SpellAssocSleep_ref, "a", %progbits
@ ProcScr_SpellAssocSleep: region-different data, JP 0x08a153ec read from funcmap-aligned code literal (US 0x089a4d64); incbin baserom.gba
	.global ProcScr_SpellAssocSleep
ProcScr_SpellAssocSleep:
	.incbin "baserom.gba", 0xA153EC, 0xA0
