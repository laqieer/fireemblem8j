	.section .rodata.dat_Ch2Events_ref, "a", %progbits
@ Ch2Events: region-different data, JP 0x08a5aa58 read from funcmap-aligned code literal (US 0x089e8934); incbin baserom.gba
	.global Ch2Events
Ch2Events:
	.incbin "baserom.gba", 0xA5AA58, 0x50
