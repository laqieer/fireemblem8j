@ data_08A63238: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A63238, "a", %progbits
	.global EventScr_Ch2Tutorial29
EventScr_Ch2Tutorial29:
	.incbin "data/residual/data_08A63238.bin", 0x0, 0x30

	.section .data.residue.08A63268, "a", %progbits
	.global EventScr_Ch2Tutorial30
EventScr_Ch2Tutorial30:
	.incbin "data/residual/data_08A63238.bin", 0x30, 0x20

