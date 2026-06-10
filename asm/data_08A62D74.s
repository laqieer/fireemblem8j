@ data_08A62D74: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A62D74, "a", %progbits
	.global EventScr_Ch2Tutorial25
EventScr_Ch2Tutorial25:
	.incbin "data/residual/data_08A62D74.bin", 0x0, 0x30

	.section .data.residue.08A62DA4, "a", %progbits
	.global EventScr_Ch2Tutorial26
EventScr_Ch2Tutorial26:
	.incbin "data/residual/data_08A62D74.bin", 0x30, 0x28

	.section .data.residue.08A62DCC, "a", %progbits
	.global EventScr_Ch2_5
EventScr_Ch2_5:
	.incbin "data/residual/data_08A62D74.bin", 0x58, 0x34

