	.section .rodata.dat_FinalChapterMap2Changes_ref, "a", %progbits
@ FinalChapterMap2Changes: region-different data, JP 0x08a5c2e4 read from funcmap-aligned code literal (US 0x08a1ea44); incbin baserom.gba
	.global FinalChapterMap2Changes
FinalChapterMap2Changes:
	.incbin "baserom.gba", 0xA5C2E4, 0x188
