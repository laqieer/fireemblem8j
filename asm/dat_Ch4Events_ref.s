	.section .rodata.dat_Ch4Events_ref, "a", %progbits
@ Ch4Events: region-different data, JP 0x08a5ac44 read from funcmap-aligned code literal (US 0x089e8b20); incbin baserom.gba
	.global Ch4Events
Ch4Events:
	.incbin "data/residual/Ch4Events.bin"
