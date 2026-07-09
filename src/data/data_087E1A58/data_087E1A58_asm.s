@ Descriptive assembly extracted from inline __asm__ in data_087E1A58.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .data.residue.087E1A58, "aw", %progbits
	.global data_087E1A58
data_087E1A58:
	.4byte 0x40000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte data_087E1A58 + 0x1
	.4byte 0x80000000
	.section .data.residue.087E1B48, "aw", %progbits
data_087E1B48:
	.4byte 0x00000001
	.4byte sBanimEkrPopupProcNames + 0x18
	.4byte 0x00000003
	.4byte EkrHenseiInit_Init + 0x1
	.4byte 0x00000003
	.4byte EkrHenseiInit_SetupFade + 0x1
	.4byte 0x00000003
	.4byte EkrHenseiInit_FadeInLoop + 0x1
	.4byte 0x00000003
	.4byte EkrHenseiInit_End + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000001
	.4byte sBanimEkrPopupProcNames + 0x2C
	.4byte 0x00000003
	.4byte EkrHenseiEnd_Init + 0x1
	.4byte 0x00000003
	.4byte EkrHenseiEnd_FadeOutLoop + 0x1
	.4byte 0x00000003
	.4byte EkrHenseiEnd_End + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
