/* byte-neutral SPLIT of data_08A5AAA8 into 8 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A5AAA8, "aw", %progbits
	.global EventListScr_Ch3_Turn
EventListScr_Ch3_Turn:
	.4byte 0x00070002
	.4byte EventScr_Ch3_Turn1Npc
	.4byte 0x00400101
	.4byte 0x00080002
	.4byte EventScr_Ch3_Turn2Player
	.4byte 0x00000202
	.4byte 0x00000000
	.section .data.residue.08A5AAC4, "aw", %progbits
	.global EventListScr_Ch3_Character
EventListScr_Ch3_Character:
	.4byte 0x00090003
	.4byte EventScr_Ch3_Talk_NeimiColm
	.4byte 0x00000908
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.08A5AAD8, "aw", %progbits
	.global EventListScr_Ch3_Location
EventListScr_Ch3_Location:
	.4byte 0x00000007
	.4byte 0x00000014
	.4byte 0x00140306
	.4byte 0x00000007
	.4byte 0x00000028
	.4byte 0x00140308
	.4byte 0x00000007
	.4byte 0x00000001
	.4byte 0x0014030A
	.4byte 0x00000007
	.4byte 0x0000001C
	.4byte 0x00140C06
	.4byte 0x00030005
	.4byte 0x00000001
	.4byte 0x0011010E
	.4byte 0x00000008
	.4byte 0x00000001
	.4byte 0x00120A06
	.4byte 0x00000008
	.4byte 0x00000001
	.4byte 0x0012050A
	.4byte 0x00000008
	.4byte 0x00000001
	.4byte 0x00120302
	.4byte 0x00000000
	.section .data.residue.08A5AB3C, "aw", %progbits
	.global EventListScr_Ch3_Misc
EventListScr_Ch3_Misc:
	.4byte 0x00000001
	.4byte data_085B9EE8
	.4byte 0x00000065
	.4byte 0x00000000
	.section .data.residue.08A5AB4C, "aw", %progbits
	.global EventListScr_Ch3_SelectUnit
EventListScr_Ch3_SelectUnit:
	.4byte 0x00000000
	.section .data.residue.08A5AB50, "aw", %progbits
	.global EventListScr_Ch3_SelectDestination
EventListScr_Ch3_SelectDestination:
	.4byte 0x00000000
	.section .data.residue.08A5AB54, "aw", %progbits
	.global EventListScr_Ch3_UnitMove
EventListScr_Ch3_UnitMove:
	.4byte 0x00000000
	.section .data.residue.08A5AB58, "aw", %progbits
	.global EventListScr_Ch3_Tutorials
EventListScr_Ch3_Tutorials:
	.4byte 0x00000000
/* de-pointered slice data_08A5AAA8: ptr=4 data=41 skip=0 */
