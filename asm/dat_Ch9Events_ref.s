	.section .rodata.dat_Ch9Events_ref, "a", %progbits
@ Ch9Events: region-different data, JP 0x08159850 read from funcmap-aligned code literal (US 0x089ea348); incbin baserom.gba
	.global Ch9Events
Ch9Events:
	.incbin "baserom.gba", 0x159850, 0x50
