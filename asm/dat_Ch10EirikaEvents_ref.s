	.section .rodata.dat_Ch10EirikaEvents_ref, "a", %progbits
@ Ch10EirikaEvents: region-different data, JP 0x08a5b3d4 read from funcmap-aligned code literal (US 0x089e92b0); incbin baserom.gba
	.global Ch10EirikaEvents
Ch10EirikaEvents:
	.incbin "baserom.gba", 0xA5B3D4, 0x50
