@ data_08A61F60: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A61F60, "a", %progbits
	.global EventScr_Ch1Tut_GuideMsg944
EventScr_Ch1Tut_GuideMsg944:
	@ de-pointered (scripts/repoint_table.py): ptr=3 data=58 skip=1
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x09041B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00D60229
	.4byte 0x00000120
	.4byte 0x00010540
	.4byte 0x00000013
	.4byte 0x00033425
	.4byte 0x003C0E20
	.4byte 0x00002F40
	.4byte 0x02080003
	.4byte 0x00003020
	.4byte 0x000D0540
	.4byte 0x00000000
	.4byte 0x00010540
	.4byte 0x00000000
	.4byte 0x00000721
	.4byte 0x00010540
	.4byte 0x00020001
	.4byte 0x00000721
	.4byte 0x00010540
	.4byte 0x00000201
	.4byte 0x00000721
	.4byte 0x00010540
	.4byte 0xFFFFFFFF
	.4byte 0x00000721
	.4byte 0x000B0540
	.4byte 0x00030008
	.4byte 0x00033F40
	.4byte 0x0000FFFF
	.4byte 0x00020540
	.4byte EventScr_Ch1Tut_GuideMsg944
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00002F40
	.4byte 0x01080004
	.4byte 0x00003020
	.4byte 0x00043B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001520
	.4byte 0x00001A20
	.4byte 0x08F31B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00001521
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x09061B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00033B25
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00020B41
	.4byte EventScr_Ch1Tut_TradeSelectGalliamIdle1
	.4byte 0x40003D20
	.4byte 0x00000120

	.section .data.residue.08A61F80, "a", %progbits
	.global EventScr_Ch1Tut_GilliamBattle
EventScr_Ch1Tut_GilliamBattle:
	.incbin "data/residual/data_08A61F60.bin", 0x20, 0xD8

