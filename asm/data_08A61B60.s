@ data_08A61B60: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A61B60, "a", %progbits
	.global EventScr_Ch1_Turn1Player
EventScr_Ch1_Turn1Player:
	@ de-pointered (scripts/repoint_table.py): ptr=2 data=13 skip=1
	.4byte 0x00020540
	.4byte EventScr_Ch1Tut_ChooseSethTurn1
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00131220
	.4byte 0x00463B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F01B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00070228
	.4byte 0x00000120

	.section .data.residue.08A61B78, "a", %progbits
	.global EventScr_Ch1_Turn1Enemy
EventScr_Ch1_Turn1Enemy:
	@ de-pointered (scripts/repoint_table.py): ptr=2 data=13 skip=1
	.4byte 0x00020540
	.4byte EventScr_Ch1Tut_ChooseSethTurn1
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00131220
	.4byte 0x00463B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F01B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00070228
	.4byte 0x00000120

