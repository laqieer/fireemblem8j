@ data_08908590: region-different residue split into 17 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08908590, "a", %progbits
	.global REDA_Ch1Ally_Eirika
REDA_Ch1Ally_Eirika:
	.incbin "data/residual/data_08908590.bin", 0x0, 0x8

	.section .data.residue.08908598, "a", %progbits
	.global REDA_Ch1Ally_Seth
REDA_Ch1Ally_Seth:
	.incbin "data/residual/data_08908590.bin", 0x8, 0x8

	.section .data.residue.089085A0, "a", %progbits
	.global REDA_Ch1_0
REDA_Ch1_0:
	.incbin "data/residual/data_08908590.bin", 0x10, 0x8

	.section .data.residue.089085A8, "a", %progbits
	.global REDA_Ch1_1
REDA_Ch1_1:
	.incbin "data/residual/data_08908590.bin", 0x18, 0x8

	.section .data.residue.089085B0, "a", %progbits
	.global REDA_Ch1_2
REDA_Ch1_2:
	.incbin "data/residual/data_08908590.bin", 0x20, 0x10

	.section .data.residue.089085C0, "a", %progbits
	.global REDA_Ch1_3
REDA_Ch1_3:
	.incbin "data/residual/data_08908590.bin", 0x30, 0x8

	.section .data.residue.089085C8, "a", %progbits
	.global REDA_Ch1_4
REDA_Ch1_4:
	.incbin "data/residual/data_08908590.bin", 0x38, 0x8

	.section .data.residue.089085D0, "a", %progbits
	.global REDA_Ch1_5
REDA_Ch1_5:
	.incbin "data/residual/data_08908590.bin", 0x40, 0x8

	.section .data.residue.089085D8, "a", %progbits
	.global REDA_Ch1_6
REDA_Ch1_6:
	.incbin "data/residual/data_08908590.bin", 0x48, 0x8

	.section .data.residue.089085E0, "a", %progbits
	.global REDA_Ch1_Franz
REDA_Ch1_Franz:
	.incbin "data/residual/data_08908590.bin", 0x50, 0x8

	.section .data.residue.089085E8, "a", %progbits
	.global REDA_Ch1_Gilliam
REDA_Ch1_Gilliam:
	.incbin "data/residual/data_08908590.bin", 0x58, 0x8

	.section .data.residue.089085F0, "a", %progbits
	.global REDA_Ch1_7
REDA_Ch1_7:
	.incbin "data/residual/data_08908590.bin", 0x60, 0x8

	.section .data.residue.089085F8, "a", %progbits
	.global REDA_Ch1_8
REDA_Ch1_8:
	.incbin "data/residual/data_08908590.bin", 0x68, 0x8

	.section .data.residue.08908600, "a", %progbits
	.global REDA_Ch1_9
REDA_Ch1_9:
	.incbin "data/residual/data_08908590.bin", 0x70, 0x8

	.section .data.residue.08908608, "a", %progbits
	.global REDA_Ch1_NpcCavalier
REDA_Ch1_NpcCavalier:
	.incbin "data/residual/data_08908590.bin", 0x78, 0x18

	.section .data.residue.08908620, "a", %progbits
	.global REDA_Ch1_NpcMercenary
REDA_Ch1_NpcMercenary:
	.incbin "data/residual/data_08908590.bin", 0x90, 0x8

	.section .data.residue.08908628, "a", %progbits
	.global UnitDef_Event_Ch1Ally
UnitDef_Event_Ch1Ally:
	.incbin "data/residual/data_08908590.bin", 0x98, 0x3C

