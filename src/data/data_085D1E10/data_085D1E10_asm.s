@ Descriptive assembly extracted from inline __asm__ in data_085D1E10.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .data.residue.085D1E38, "aw", %progbits
	.global data_085D1E38
data_085D1E38:
	.4byte 0x00000001
	.4byte gBmdifficulty_6 + 0x78
	.4byte 0x00000002
	.4byte AiPhaseBerserkInit + 0x1
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte AiPhaseCleanup + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
