@ data_08A61C70: region-different residue split into 7 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A61C70, "a", %progbits
	.global EventScr_Ch1_Talk_SethFranz
EventScr_Ch1_Talk_SethFranz:
	.incbin "data/residual/data_08A61C70.bin", 0x0, 0x20

	.section .data.residue.08A61C90, "a", %progbits
	.global EventScr_Ch1_Talk_EirikaFranz
EventScr_Ch1_Talk_EirikaFranz:
	.incbin "data/residual/data_08A61C70.bin", 0x20, 0x20

	.section .data.residue.08A61CB0, "a", %progbits
	.global EventScr_Ch1_Loca_Visit1
EventScr_Ch1_Loca_Visit1:
	.incbin "data/residual/data_08A61C70.bin", 0x40, 0x2C

	.section .data.residue.08A61CDC, "a", %progbits
	.global EventScr_Ch1_Loca_Visit2
EventScr_Ch1_Loca_Visit2:
	.incbin "data/residual/data_08A61C70.bin", 0x6C, 0x28

	.section .data.residue.08A61D04, "a", %progbits
	.global EventScr_Ch1_Misc_Area
EventScr_Ch1_Misc_Area:
	.incbin "data/residual/data_08A61C70.bin", 0x94, 0x1C

	.section .data.residue.08A61D20, "a", %progbits
	.global EventScr_Ch1_Turn_EnemyReinforceArrive
EventScr_Ch1_Turn_EnemyReinforceArrive:
	.incbin "data/residual/data_08A61C70.bin", 0xB0, 0x3C

	.section .data.residue.08A61D5C, "a", %progbits
	.global EventScr_Ch1Tut_GuideWTA
EventScr_Ch1Tut_GuideWTA:
	.incbin "data/residual/data_08A61C70.bin", 0xEC, 0x20

