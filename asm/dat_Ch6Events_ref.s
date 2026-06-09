	.section .rodata.dat_Ch6Events_ref, "a", %progbits
@ Ch6Events: region-different data, JP 0x08a5aee8 read from funcmap-aligned code literal (US 0x089e8dc4); incbin baserom.gba
	.global Ch6Events
Ch6Events:
	.incbin "baserom.gba", 0xA5AEE8, 0x50
