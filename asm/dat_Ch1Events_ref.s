	.section .rodata.dat_Ch1Events_ref, "a", %progbits
@ Ch1Events: region-different data, JP 0x08a5a8c0 read from funcmap-aligned code literal (US 0x089e879c); incbin baserom.gba
	.global Ch1Events
Ch1Events:
	.incbin "data/residual/Ch1Events.bin"
