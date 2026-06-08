	.section .rodata.dat_MelkaenCoastMapChanges_ref, "a", %progbits
@ MelkaenCoastMapChanges: region-different data, JP 0x08a5e560 read from funcmap-aligned code literal (US 0x08a1f93c); incbin baserom.gba
	.global MelkaenCoastMapChanges
MelkaenCoastMapChanges:
	.incbin "baserom.gba", 0xA5E560, 0x16C
