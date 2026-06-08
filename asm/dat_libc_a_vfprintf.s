	.section .rodata.dat_libc_a_vfprintf, "a", %progbits
	.align 2
@ tools/agbcc/lib/libc.a(vfprintf.o: region-same content at JP 0x085773b4 (US 0x08587700, shift -0x1034C); incbin baserom.gba
	.global blanks.12
blanks.12:
	.incbin "baserom.gba", 0x5773B4, 0x10
	.global zeroes.13
zeroes.13:
	.incbin "baserom.gba", 0x5773C4, 0x6A
