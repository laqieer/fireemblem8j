@ data_085C6770: region-different residue split into 5 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.085C6770, "a", %progbits
	.global sProcScr_StatusHealEffect_OverlayBg
sProcScr_StatusHealEffect_OverlayBg:
	.incbin "data/residual/data_085C6770.bin", 0x0, 0x18

	.section .data.residue.085C6788, "a", %progbits
	.global sProcScr_StatusHealEffect_BlendedSprite
sProcScr_StatusHealEffect_BlendedSprite:
	.incbin "data/residual/data_085C6770.bin", 0x18, 0x20

	.section .data.residue.085C67A8, "a", %progbits
	.global sProcScr_StatusHealEffect_BlendAnim
sProcScr_StatusHealEffect_BlendAnim:
	.incbin "data/residual/data_085C6770.bin", 0x38, 0x30

	.section .data.residue.085C67D8, "a", %progbits
	.global sProcScr_StatusHealEffect_PalAnim
sProcScr_StatusHealEffect_PalAnim:
	.incbin "data/residual/data_085C6770.bin", 0x68, 0x20

	.section .data.residue.085C67F8, "a", %progbits
	.global sProcScr_StatusHealEffect
sProcScr_StatusHealEffect:
	.incbin "data/residual/data_085C6770.bin", 0x88, 0x38

