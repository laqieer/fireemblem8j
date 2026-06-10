@ data_08A68360: region-different residue split into 6 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A68360, "a", %progbits
	.global EventScr_Ch14A_2
EventScr_Ch14A_2:
	.incbin "data/residual/data_08A68360.bin", 0x0, 0x18

	.section .data.residue.08A68378, "a", %progbits
	.global EventScr_Ch14A_3
EventScr_Ch14A_3:
	.incbin "data/residual/data_08A68360.bin", 0x18, 0x18

	.section .data.residue.08A68390, "a", %progbits
	.global EventScr_Ch14A_4
EventScr_Ch14A_4:
	.incbin "data/residual/data_08A68360.bin", 0x30, 0x1C

	.section .data.residue.08A683AC, "a", %progbits
	.global EventScr_Ch14A_5
EventScr_Ch14A_5:
	.incbin "data/residual/data_08A68360.bin", 0x4C, 0x18

	.section .data.residue.08A683C4, "a", %progbits
	.global EventScr_Ch14A_6
EventScr_Ch14A_6:
	.incbin "data/residual/data_08A68360.bin", 0x64, 0x20

	.section .data.residue.08A683E4, "a", %progbits
	.global EventScr_Ch14A_7
EventScr_Ch14A_7:
	.incbin "data/residual/data_08A68360.bin", 0x84, 0x34

