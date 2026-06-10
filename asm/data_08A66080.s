@ data_08A66080: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A66080, "a", %progbits
	.global EventScr_Ch9A_0
EventScr_Ch9A_0:
	.incbin "data/residual/data_08A66080.bin", 0x0, 0x28

	.section .data.residue.08A660A8, "a", %progbits
	.global EventScr_Ch9A_1
EventScr_Ch9A_1:
	.incbin "data/residual/data_08A66080.bin", 0x28, 0x28

