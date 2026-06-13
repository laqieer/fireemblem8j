@ data_08B25710: region-different residue split into 1 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08B25710, "a", %progbits
	.global Ap_WmHightLightMap4
Ap_WmHightLightMap4:
	.incbin "data/residual/data_08B25710.bin", 0x0, 0x5C

