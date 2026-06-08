	.section .rodata.dat_Ch11EphraimMapChanges_ref, "a", %progbits
@ Ch11EphraimMapChanges: region-different data, JP 0x08a5c6e0 read from funcmap-aligned code literal (US 0x08a1ee28); incbin baserom.gba
	.global Ch11EphraimMapChanges
Ch11EphraimMapChanges:
	.incbin "baserom.gba", 0xA5C6E0, 0x110
