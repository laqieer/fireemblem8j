@ Descriptive assembly extracted from inline __asm__ in data_085775C9.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.
@ Residue starts at non-4-aligned VMA 0x085775C9 and data_085775CC holds a
@ .4byte relocation at an unaligned offset, so a typed C u32[] cannot live here
@ (agbcc .align would shift the ROM); descriptive .s keeps it byte-exact.

	.section .data.residue.085775C9, "aw", %progbits
	.global data_085775C9
data_085775C9:
	.byte 0x00, 0x00, 0x00
	.global data_085775CC
data_085775CC:
	.4byte 0x02024CC0
	.4byte 0x0001000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte AsnycKeyStatusExt + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x02022CA8
	.4byte 0x020234A8
	.4byte 0x02023CA8
	.4byte 0x020244A8
