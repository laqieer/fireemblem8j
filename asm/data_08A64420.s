@ data_08A64420: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A64420, "a", %progbits
	.global EventScr_Ch5_6
EventScr_Ch5_6:
	.incbin "data/residual/data_08A64420.bin", 0x0, 0x18

	.section .data.residue.08A64438, "a", %progbits
	.global EventScr_Ch5_7
EventScr_Ch5_7:
	.incbin "data/residual/data_08A64420.bin", 0x18, 0x18

	.section .data.residue.08A64450, "a", %progbits
	.global EventScr_Ch5_8
EventScr_Ch5_8:
	.incbin "data/residual/data_08A64420.bin", 0x30, 0x24

	.section .data.residue.08A64474, "a", %progbits
	.global EventScr_Ch5_9
EventScr_Ch5_9:
	.incbin "data/residual/data_08A64420.bin", 0x54, 0x20

