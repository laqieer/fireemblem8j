@ data_0890B3B0: region-different residue split into 10 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.0890B3B0, "a", %progbits
	.global REDA_Ch6_1
REDA_Ch6_1:
	.incbin "data/residual/data_0890B3B0.bin", 0x0, 0x8

	.section .data.residue.0890B3B8, "a", %progbits
	.global REDA_Ch6_2
REDA_Ch6_2:
	.incbin "data/residual/data_0890B3B0.bin", 0x8, 0x8

	.section .data.residue.0890B3C0, "a", %progbits
	.global REDA_Ch6_3
REDA_Ch6_3:
	.incbin "data/residual/data_0890B3B0.bin", 0x10, 0x8

	.section .data.residue.0890B3C8, "a", %progbits
	.global REDA_Ch6_4
REDA_Ch6_4:
	.incbin "data/residual/data_0890B3B0.bin", 0x18, 0x8

	.section .data.residue.0890B3D0, "a", %progbits
	.global REDA_Ch7_0
REDA_Ch7_0:
	.incbin "data/residual/data_0890B3B0.bin", 0x20, 0x8

	.section .data.residue.0890B3D8, "a", %progbits
	.global REDA_Ch7_1
REDA_Ch7_1:
	.incbin "data/residual/data_0890B3B0.bin", 0x28, 0x8

	.section .data.residue.0890B3E0, "a", %progbits
	.global REDA_Ch7_2
REDA_Ch7_2:
	.incbin "data/residual/data_0890B3B0.bin", 0x30, 0x8

	.section .data.residue.0890B3E8, "a", %progbits
	.global REDA_Ch7_3
REDA_Ch7_3:
	.incbin "data/residual/data_0890B3B0.bin", 0x38, 0x8

	.section .data.residue.0890B3F0, "a", %progbits
	.global REDA_Ch7Enemy_0
REDA_Ch7Enemy_0:
	.incbin "data/residual/data_0890B3B0.bin", 0x40, 0x8

	.section .data.residue.0890B3F8, "a", %progbits
	.global REDA_Ch7Enemy_1
REDA_Ch7Enemy_1:
	.incbin "data/residual/data_0890B3B0.bin", 0x48, 0x8

