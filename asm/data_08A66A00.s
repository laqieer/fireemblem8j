@ data_08A66A00: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A66A00, "a", %progbits
	.global EventScr_Ch10A_14
EventScr_Ch10A_14:
	.incbin "data/residual/data_08A66A00.bin", 0x0, 0x2C

	.section .data.residue.08A66A2C, "a", %progbits
	.global EventScr_Ch11a_BeginningScene
EventScr_Ch11a_BeginningScene:
	.incbin "data/residual/data_08A66A00.bin", 0x2C, 0x184

