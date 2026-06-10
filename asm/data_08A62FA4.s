@ data_08A62FA4: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A62FA4, "a", %progbits
	.global EventScr_Ch2Tutorial16
EventScr_Ch2Tutorial16:
	.incbin "data/residual/data_08A62FA4.bin", 0x0, 0x10

	.section .data.residue.08A62FB4, "a", %progbits
	.global EventScr_Ch2Tutorial17
EventScr_Ch2Tutorial17:
	.incbin "data/residual/data_08A62FA4.bin", 0x10, 0x18

	.section .data.residue.08A62FCC, "a", %progbits
	.global EventScr_Ch2_6
EventScr_Ch2_6:
	.incbin "data/residual/data_08A62FA4.bin", 0x28, 0x3C

