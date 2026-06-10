@ data_08A63894: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A63894, "a", %progbits
	.global EventScr_Ch3_6
EventScr_Ch3_6:
	.incbin "data/residual/data_08A63894.bin", 0x0, 0x24

	.section .data.residue.08A638B8, "a", %progbits
	.global EventScr_Ch3_7
EventScr_Ch3_7:
	.incbin "data/residual/data_08A63894.bin", 0x24, 0x20

