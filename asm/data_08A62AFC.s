@ data_08A62AFC: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A62AFC, "a", %progbits
	.global EventScr_Ch2Tutorial6
EventScr_Ch2Tutorial6:
	.incbin "data/residual/data_08A62AFC.bin", 0x0, 0x10

	.section .data.residue.08A62B0C, "a", %progbits
	.global EventScr_Ch2Tutorial7
EventScr_Ch2Tutorial7:
	.incbin "data/residual/data_08A62AFC.bin", 0x10, 0x18

	.section .data.residue.08A62B24, "a", %progbits
	.global EventScr_Ch2_4
EventScr_Ch2_4:
	.incbin "data/residual/data_08A62AFC.bin", 0x28, 0x38

