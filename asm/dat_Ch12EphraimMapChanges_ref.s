	.section .rodata.dat_Ch12EphraimMapChanges_ref, "a", %progbits
@ Ch12EphraimMapChanges: region-different data, JP 0x08a5c7f0 read from funcmap-aligned code literal (US 0x08a1ee74); incbin baserom.gba
	.global Ch12EphraimMapChanges
Ch12EphraimMapChanges:
	.incbin "baserom.gba", 0xA5C7F0, 0x184
