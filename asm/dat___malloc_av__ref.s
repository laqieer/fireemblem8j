	.section .rodata.dat___malloc_av__ref, "a", %progbits
@ __malloc_av_: region-different data, JP 0x08bb8a8c read from funcmap-aligned code literal (US 0x08b1fa38); incbin baserom.gba
	.global __malloc_av_
__malloc_av_:
	.incbin "baserom.gba", 0xBB8A8C, 0x408
