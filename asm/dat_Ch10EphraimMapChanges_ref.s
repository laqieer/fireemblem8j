	.section .rodata.dat_Ch10EphraimMapChanges_ref, "a", %progbits
@ Ch10EphraimMapChanges: region-different data, JP 0x08a5c5cc read from funcmap-aligned code literal (US 0x08a1eaf0); incbin baserom.gba
	.global Ch10EphraimMapChanges
Ch10EphraimMapChanges:
	.incbin "baserom.gba", 0xA5C5CC, 0x114
