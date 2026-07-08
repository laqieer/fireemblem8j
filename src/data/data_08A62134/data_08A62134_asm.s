@ Descriptive assembly extracted from inline __asm__ in data_08A62134.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .data.residue.08A62134, "aw", %progbits
	.global EventScr_Ch1Tut_TradeSelectGalliamEnd
EventScr_Ch1Tut_TradeSelectGalliamEnd:
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
	.section .data.residue.08A62168, "aw", %progbits
	.global EventScr_Ch1Tut_AfterTrade
EventScr_Ch1Tut_AfterTrade:
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
	.section .data.residue.08A62198, "aw", %progbits
	.global EventScr_Ch1Tut_PostTradeAndItemUseAction
EventScr_Ch1Tut_PostTradeAndItemUseAction:
	.4byte 0x00043B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F21B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00003D20
	.4byte 0x00000A40
	.4byte data_08A62340 + 0x7C
	.4byte 0x00070228
	.4byte 0x00000120
