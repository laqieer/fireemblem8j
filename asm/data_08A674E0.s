@ data_08A674E0: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A674E0, "a", %progbits
	.global EventScr_Ch12A_1
EventScr_Ch12A_1:
	.incbin "data/residual/data_08A674E0.bin", 0x0, 0xD8

	.section .data.residue.08A675B8, "a", %progbits
	.global EventScr_Ch12A_2
EventScr_Ch12A_2:
	.incbin "data/residual/data_08A674E0.bin", 0xD8, 0x1C

	.section .data.residue.08A675D4, "a", %progbits
	.global EventScr_Ch12A_3
EventScr_Ch12A_3:
	.incbin "data/residual/data_08A674E0.bin", 0xF4, 0x28

	.section .data.residue.08A675FC, "a", %progbits
	.global EventScr_Ch12A_4
EventScr_Ch12A_4:
	.incbin "data/residual/data_08A674E0.bin", 0x11C, 0x1C

