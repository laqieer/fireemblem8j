	.section .rodata.dat_FinalEphraimEvents1_ref, "a", %progbits
@ FinalEphraimEvents1: region-different data, JP 0x08a5d5f8 read from funcmap-aligned code literal (US 0x089eb44c); incbin baserom.gba
	.global FinalEphraimEvents1
FinalEphraimEvents1:
	.incbin "baserom.gba", 0xA5D5F8, 0x50
