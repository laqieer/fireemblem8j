/* byte-neutral SPLIT of data_08A5A828 into 6 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A5A828, "aw", %progbits
	.global EventListScr_Ch1_Location
EventListScr_Ch1_Location:
	.4byte 0x00000005
	.4byte EventScr_Ch1_Loca_Visit1
	.4byte 0x0010060D
	.4byte 0x00000005
	.4byte EventScr_Ch1_Loca_Visit2
	.4byte 0x0010040A
	.4byte 0x00030005
	.4byte 0x00000001
	.4byte 0x00110202
	.4byte 0x00000000
	.section .data.residue.08A5A850, "aw", %progbits
	.global EventListScr_Ch1_Misc
EventListScr_Ch1_Misc:
	.4byte 0x00070001
	.4byte EventScr_Ch1_Misc_DefeatBoss
	.4byte 0x00000002
	.4byte 0x000A000B
	.4byte EventScr_Ch1_Misc_Area
	.4byte 0x09070000
	.4byte 0x00000001
	.4byte data_085B9EE8
	.4byte 0x00000065
	.4byte 0x00000000
	.section .data.residue.08A5A878, "aw", %progbits
	.global EventListScr_Ch1_SelectUnit
EventListScr_Ch1_SelectUnit:
	.4byte 0x00000000
	.section .data.residue.08A5A87C, "aw", %progbits
	.global EventListScr_Ch1_SelectDestination
EventListScr_Ch1_SelectDestination:
	.4byte 0x00000000
	.section .data.residue.08A5A880, "aw", %progbits
	.global EventListScr_Ch1_UnitMove
EventListScr_Ch1_UnitMove:
	.4byte 0x00000000
	.section .data.residue.08A5A884, "aw", %progbits
	.global EventListScr_Ch1_Tutorial
EventListScr_Ch1_Tutorial:
	.4byte EventScr_Ch1Tut_EirikaVisitHouseIdle1
	.4byte EventScr_Ch1Tut_EirikaVisitHouseIdle2
	.4byte EventScr_Ch1Tut_EirikaVisitHouseEnd
	.4byte EventScr_Ch1Tut_GuideTerrainHeal
	.4byte EventScr_Ch1Tut_TradeSelectGalliamIdle1
	.4byte EventScr_Ch1Tut_TradeSelectGalliamIdle2
	.4byte EventScr_Ch1Tut_TradeSelectGalliamEnd
	.4byte EventScr_Ch1Tut_AfterTrade
	.4byte EventScr_Ch1Tut_PostTradeAndItemUseAction
	.4byte EventScr_Ch1Tut_SethMoveToEnemy
	.4byte EventScr_Ch1Tut_BeforeSethMoveToEnemy
	.4byte data_08A62340
	.4byte data_08A62340 + 0x34
	.4byte data_08A62340 + 0x68
	.4byte 0x00000000
/* de-pointered slice data_08A5A828: ptr=19 data=19 skip=0 */
