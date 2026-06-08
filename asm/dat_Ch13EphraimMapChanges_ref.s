	.section .rodata.dat_Ch13EphraimMapChanges_ref, "a", %progbits
@ Ch13EphraimMapChanges: region-different data, JP 0x08a5c974 read from funcmap-aligned code literal (US 0x08a1eec8); incbin baserom.gba
	.global Ch13EphraimMapChanges
Ch13EphraimMapChanges:
	.incbin "baserom.gba", 0xA5C974, 0x27C
