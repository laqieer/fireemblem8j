@ data_08A70F34: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A70F34, "a", %progbits
	.global EventScr_Ruin_43
EventScr_Ruin_43:
	.incbin "data/residual/data_08A70F34.bin", 0x0, 0x98

	.section .data.residue.08A70FCC, "a", %progbits
	.global EventScr_Ruin_44
EventScr_Ruin_44:
	.incbin "data/residual/data_08A70F34.bin", 0x98, 0x84

