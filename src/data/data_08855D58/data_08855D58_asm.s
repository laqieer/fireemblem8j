@ Descriptive assembly extracted from inline __asm__ in data_08855D58.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .data.residue.08855D58, "aw", %progbits
	.global data_08855D58
data_08855D58:
	.4byte 0x00000002
	.4byte sub_807A154 + 0x1
	.4byte 0x00000003
	.4byte EkrDemonkingObj_UpdateBgPosLoop + 0x1
	.4byte 0x00000004
	.4byte EkrDemonkingObj_RevealOnEnd + 0x1
	.4byte 0x00000002
	.4byte EkrDemonkingObj_RevealInit + 0x1
	.4byte 0x00000002
	.4byte EkrDemonkingObj_RevealTimerInit + 0x1
	.4byte 0x00000003
	.4byte EkrDemonkingObj_RevealLoop + 0x1
	.4byte 0x00000008
	.4byte ProcScr_EkrdragonDemonkingobj_2
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.08855DB0, "aw", %progbits
data_08855DB0:
	.4byte 0x00F0000F
	.4byte 0xF0000F00
	.4byte 0x00100001
	.4byte 0x10000100
	.section .data.residue.08855DD8, "aw", %progbits
data_08855DD8:
	.4byte 0x00000001
	.4byte data_080ED67C + 0x164
	.4byte 0x00000002
	.4byte EfxSelfThunderBGOnInit + 0x1
	.4byte 0x00000003
	.4byte EfxSelfThunderBGMain + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
