@ data_08A61F60: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A61F60, "a", %progbits
	.global EventScr_Ch1Tut_GuideMsg944
EventScr_Ch1Tut_GuideMsg944:
	.incbin "data/residual/data_08A61F60.bin", 0x0, 0x20

	.section .data.residue.08A61F80, "a", %progbits
	.global EventScr_Ch1Tut_GilliamBattle
EventScr_Ch1Tut_GilliamBattle:
	.incbin "data/residual/data_08A61F60.bin", 0x20, 0xD8

