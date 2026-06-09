	.section .rodata.dat_Ch3Events_ref, "a", %progbits
@ Ch3Events: region-different data, JP 0x08a5ab5c read from funcmap-aligned code literal (US 0x089e8a38); incbin baserom.gba
	.global Ch3Events
Ch3Events:
	.incbin "baserom.gba", 0xA5AB5C, 0x50
