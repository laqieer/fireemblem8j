@ data_08908DBC: region-different residue split into 24 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08908DBC, "a", %progbits
	.global REDA_Ch4Ally_0_EIRIKA
REDA_Ch4Ally_0_EIRIKA:
	.incbin "data/residual/data_08908DBC.bin", 0x0, 0x8

	.section .data.residue.08908DC4, "a", %progbits
	.global REDA_Ch4Ally_0_MOULDER
REDA_Ch4Ally_0_MOULDER:
	.incbin "data/residual/data_08908DBC.bin", 0x8, 0x8

	.section .data.residue.08908DCC, "a", %progbits
	.global REDA_Ch4Ally_0_COLM
REDA_Ch4Ally_0_COLM:
	.incbin "data/residual/data_08908DBC.bin", 0x10, 0x8

	.section .data.residue.08908DD4, "a", %progbits
	.global REDA_Ch4Ally_0_VANESSA
REDA_Ch4Ally_0_VANESSA:
	.incbin "data/residual/data_08908DBC.bin", 0x18, 0x8

	.section .data.residue.08908DDC, "a", %progbits
	.global REDA_Ch4Ally_0_GILLIAM
REDA_Ch4Ally_0_GILLIAM:
	.incbin "data/residual/data_08908DBC.bin", 0x20, 0x8

	.section .data.residue.08908DE4, "a", %progbits
	.global REDA_Ch4Ally_0_NEIMI
REDA_Ch4Ally_0_NEIMI:
	.incbin "data/residual/data_08908DBC.bin", 0x28, 0x8

	.section .data.residue.08908DEC, "a", %progbits
	.global REDA_Ch4Ally_0_SETH
REDA_Ch4Ally_0_SETH:
	.incbin "data/residual/data_08908DBC.bin", 0x30, 0x8

	.section .data.residue.08908DF4, "a", %progbits
	.global REDA_Ch4Ally_0_ROSS
REDA_Ch4Ally_0_ROSS:
	.incbin "data/residual/data_08908DBC.bin", 0x38, 0x8

	.section .data.residue.08908DFC, "a", %progbits
	.global REDA_Ch4Ally_1_ARTUR
REDA_Ch4Ally_1_ARTUR:
	.incbin "data/residual/data_08908DBC.bin", 0x40, 0x18

	.section .data.residue.08908E14, "a", %progbits
	.global REDA_Ch4Ally_2_LUTE
REDA_Ch4Ally_2_LUTE:
	.incbin "data/residual/data_08908DBC.bin", 0x58, 0x8

	.section .data.residue.08908E1C, "a", %progbits
	.global REDA_Ch4Enemy_1_0
REDA_Ch4Enemy_1_0:
	.incbin "data/residual/data_08908DBC.bin", 0x60, 0x8

	.section .data.residue.08908E24, "a", %progbits
	.global REDA_Ch4Enemy_1_1
REDA_Ch4Enemy_1_1:
	.incbin "data/residual/data_08908DBC.bin", 0x68, 0x8

	.section .data.residue.08908E2C, "a", %progbits
	.global REDA_Ch4Enemy_1_2
REDA_Ch4Enemy_1_2:
	.incbin "data/residual/data_08908DBC.bin", 0x70, 0x8

	.section .data.residue.08908E34, "a", %progbits
	.global REDA_Ch4Enemy_1_3
REDA_Ch4Enemy_1_3:
	.incbin "data/residual/data_08908DBC.bin", 0x78, 0x8

	.section .data.residue.08908E3C, "a", %progbits
	.global REDA_Ch4Enemy_2_0
REDA_Ch4Enemy_2_0:
	.incbin "data/residual/data_08908DBC.bin", 0x80, 0x8

	.section .data.residue.08908E44, "a", %progbits
	.global REDA_Ch4Enemy_2_1
REDA_Ch4Enemy_2_1:
	.incbin "data/residual/data_08908DBC.bin", 0x88, 0x8

	.section .data.residue.08908E4C, "a", %progbits
	.global REDA_Ch4Enemy_2_2
REDA_Ch4Enemy_2_2:
	.incbin "data/residual/data_08908DBC.bin", 0x90, 0x8

	.section .data.residue.08908E54, "a", %progbits
	.global REDA_Ch4NPC_0_LARACHEL
REDA_Ch4NPC_0_LARACHEL:
	.incbin "data/residual/data_08908DBC.bin", 0x98, 0x8

	.section .data.residue.08908E5C, "a", %progbits
	.global REDA_Ch4NPC_0_RENNAC
REDA_Ch4NPC_0_RENNAC:
	.incbin "data/residual/data_08908DBC.bin", 0xA0, 0x8

	.section .data.residue.08908E64, "a", %progbits
	.global REDA_Ch4NPC_0_DOZLA
REDA_Ch4NPC_0_DOZLA:
	.incbin "data/residual/data_08908DBC.bin", 0xA8, 0x8

	.section .data.residue.08908E6C, "a", %progbits
	.global REDA_Ch4NPC_1_LARACHEL
REDA_Ch4NPC_1_LARACHEL:
	.incbin "data/residual/data_08908DBC.bin", 0xB0, 0x8

	.section .data.residue.08908E74, "a", %progbits
	.global REDA_Ch4_0
REDA_Ch4_0:
	.incbin "data/residual/data_08908DBC.bin", 0xB8, 0x8

	.section .data.residue.08908E7C, "a", %progbits
	.global REDA_Ch4NPC_1_DOZLA
REDA_Ch4NPC_1_DOZLA:
	.incbin "data/residual/data_08908DBC.bin", 0xC0, 0x8

	.section .data.residue.08908E84, "a", %progbits
	.global REDA_Ch4NPC_1_RENNAC
REDA_Ch4NPC_1_RENNAC:
	.incbin "data/residual/data_08908DBC.bin", 0xC8, 0x8

