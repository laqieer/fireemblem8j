	.section .rodata.dat_PrologueEvents_ref, "a", %progbits
@ PrologueEvents: region-different data, JP 0x08a5a760 read from funcmap-aligned code literal (US 0x089e863c); incbin baserom.gba
	.global PrologueEvents
PrologueEvents:
	.incbin "data/residual/PrologueEvents.bin"
