@ data_08A62134: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A62134, "a", %progbits
	.global EventScr_Ch1Tut_TradeSelectGalliamEnd
EventScr_Ch1Tut_TradeSelectGalliamEnd:
	@ de-pointered (scripts/repoint_table.py): ptr=2 data=44 skip=2
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x09081B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x010A1120
	.4byte 0x00870229
	.4byte 0x00040B41
	.4byte EventScr_Ch1Tut_AfterTrade
	.4byte 0x00000120
	.4byte 0x00070228
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x090D1B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00C70229
	.4byte 0x00C80229
	.4byte 0x00010B41
	.4byte EventScr_Ch1Tut_PostTradeAndItemUseAction
	.4byte 0x00000120
	.4byte 0x00043B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F21B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00003D20
	.4byte 0x00000A40
	.4byte 0x08A623BC
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x09051B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00DD0229
	.4byte 0x02023B24
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00000120

	.section .data.residue.08A62168, "a", %progbits
	.global EventScr_Ch1Tut_AfterTrade
EventScr_Ch1Tut_AfterTrade:
	@ de-pointered (scripts/repoint_table.py): ptr=2 data=44 skip=2
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x09081B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x010A1120
	.4byte 0x00870229
	.4byte 0x00040B41
	.4byte EventScr_Ch1Tut_AfterTrade
	.4byte 0x00000120
	.4byte 0x00070228
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x090D1B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00C70229
	.4byte 0x00C80229
	.4byte 0x00010B41
	.4byte EventScr_Ch1Tut_PostTradeAndItemUseAction
	.4byte 0x00000120
	.4byte 0x00043B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F21B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00003D20
	.4byte 0x00000A40
	.4byte 0x08A623BC
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x09051B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00DD0229
	.4byte 0x02023B24
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00000120

	.section .data.residue.08A62198, "a", %progbits
	.global EventScr_Ch1Tut_PostTradeAndItemUseAction
EventScr_Ch1Tut_PostTradeAndItemUseAction:
	@ de-pointered (scripts/repoint_table.py): ptr=2 data=44 skip=2
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x09081B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x010A1120
	.4byte 0x00870229
	.4byte 0x00040B41
	.4byte EventScr_Ch1Tut_AfterTrade
	.4byte 0x00000120
	.4byte 0x00070228
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x090D1B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00C70229
	.4byte 0x00C80229
	.4byte 0x00010B41
	.4byte EventScr_Ch1Tut_PostTradeAndItemUseAction
	.4byte 0x00000120
	.4byte 0x00043B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F21B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00003D20
	.4byte 0x00000A40
	.4byte 0x08A623BC
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x09051B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00DD0229
	.4byte 0x02023B24
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00000120

	.section .data.residue.08A621C8, "a", %progbits
	.global EventScr_Ch1Tut_GuideMsgSeize
EventScr_Ch1Tut_GuideMsgSeize:
	@ de-pointered (scripts/repoint_table.py): ptr=2 data=44 skip=2
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x09081B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x010A1120
	.4byte 0x00870229
	.4byte 0x00040B41
	.4byte EventScr_Ch1Tut_AfterTrade
	.4byte 0x00000120
	.4byte 0x00070228
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380048
	.4byte 0x090D1B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00C70229
	.4byte 0x00C80229
	.4byte 0x00010B41
	.4byte EventScr_Ch1Tut_PostTradeAndItemUseAction
	.4byte 0x00000120
	.4byte 0x00043B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F21B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00003D20
	.4byte 0x00000A40
	.4byte 0x08A623BC
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x09051B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00DD0229
	.4byte 0x02023B24
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00000120

