@ data_08A72A80: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A72A80, "a", %progbits
	.global gProcScr_SSBgOffsetCtrl
gProcScr_SSBgOffsetCtrl:
	.incbin "data/residual/data_08A72A80.bin", 0x0, 0x10

	.section .data.residue.08A72A90, "a", %progbits
	.global gProcScr_StatScreen
gProcScr_StatScreen:
	.incbin "data/residual/data_08A72A80.bin", 0x10, 0xC0

	.section .data.residue.08A72B50, "a", %progbits
	.global gProcScr_HelpBox
gProcScr_HelpBox:
	.incbin "data/residual/data_08A72A80.bin", 0xD0, 0x38

	.section .data.residue.08A72B88, "a", %progbits
	.global gProcScr_HelpBoxMoveCtrl
gProcScr_HelpBoxMoveCtrl:
	.incbin "data/residual/data_08A72A80.bin", 0x108, 0x30

