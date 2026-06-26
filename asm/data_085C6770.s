@ data_085C6770: region-different residue split into 5 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.085C6770, "a", %progbits
	.global sProcScr_StatusHealEffect_OverlayBg
sProcScr_StatusHealEffect_OverlayBg:
	@ de-pointered (scripts/repoint_table.py): ptr=4 data=31 skip=13
	.4byte 0x00000002
	.4byte 0x08035BA5
	.4byte 0x00000003
	.4byte 0x08035C0D
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x08035C45
	.4byte 0x00000003
	.4byte 0x08035CED
	.4byte 0x00000002
	.4byte 0x08035D45
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x08035D59
	.4byte 0x00000003
	.4byte 0x08035D81
	.4byte 0x0020000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x08035D6D
	.4byte 0x00000003
	.4byte 0x08035D81
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x08035DB9
	.4byte 0x00000003
	.4byte 0x08035E45
	.4byte 0x00000003
	.4byte 0x08035E71
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_OverlayBg
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_BlendedSprite
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_BlendAnim
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_PalAnim
	.4byte 0x0042000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x08035E9D
	.4byte 0x00000000
	.4byte 0x00000000

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

