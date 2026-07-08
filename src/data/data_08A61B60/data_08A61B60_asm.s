@ Descriptive assembly extracted from inline __asm__ in data_08A61B60.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .data.residue.08A61B60, "aw", %progbits
	.global EventScr_Ch1_Turn1Player
EventScr_Ch1_Turn1Player:
	.4byte 0x00020540
	.4byte EventScr_Ch1Tut_ChooseSethTurn1
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
