@ data_085C33C0: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.085C33C0, "a", %progbits
	.global gProcScr_PhaseIntroSquares
gProcScr_PhaseIntroSquares:
	.incbin "data/residual/data_085C33C0.bin", 0x0, 0x20

	.section .data.residue.085C33E0, "a", %progbits
	.global gProcScr_PhaseIntroBlendBox
gProcScr_PhaseIntroBlendBox:
	.incbin "data/residual/data_085C33C0.bin", 0x20, 0x20

