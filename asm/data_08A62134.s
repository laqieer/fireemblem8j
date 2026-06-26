@ data_08A62134: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A62134, "a", %progbits
	.global EventScr_Ch1Tut_TradeSelectGalliamEnd
EventScr_Ch1Tut_TradeSelectGalliamEnd:
	.incbin "data/residual/data_08A62134.bin", 0x0, 0x34

	.section .data.residue.08A62168, "a", %progbits
	.global EventScr_Ch1Tut_AfterTrade
EventScr_Ch1Tut_AfterTrade:
	.incbin "data/residual/data_08A62134.bin", 0x34, 0x30

	.section .data.residue.08A62198, "a", %progbits
	.global EventScr_Ch1Tut_PostTradeAndItemUseAction
EventScr_Ch1Tut_PostTradeAndItemUseAction:
	.incbin "data/residual/data_08A62134.bin", 0x64, 0x30

	.section .data.residue.08A621C8, "a", %progbits
	.global EventScr_Ch1Tut_GuideMsgSeize
EventScr_Ch1Tut_GuideMsgSeize:
	.incbin "data/residual/data_08A62134.bin", 0x94, 0x2C

