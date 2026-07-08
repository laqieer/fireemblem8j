/* byte-neutral SPLIT of data_08A5B090 into 6 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A5B090, "aw", %progbits
	.global EventListScr_Ch8_Location
EventListScr_Ch8_Location:
	.4byte 0x00000008
	.4byte 0x00000001
	.4byte 0x00120714
	.4byte 0x00000008
	.4byte 0x00000001
	.4byte 0x00120501
	.4byte 0x00000007
	.4byte 0x00000004
	.4byte 0x00140301
	.4byte 0x00000007
	.4byte 0x00000067
	.4byte 0x00140302
	.4byte 0x00030005
	.4byte 0x00000001
	.4byte 0x0011020A
	.4byte 0x00000007
	.4byte 0x0000005B
	.4byte 0x00140413
	.4byte 0x00000000
	.section .data.residue.08A5B0DC, "aw", %progbits
	.global EventListScr_Ch8_Misc
EventListScr_Ch8_Misc:
	.4byte 0x000B000B
	.4byte EventScr_Ch8_EndingScene + 0xA8
	.4byte 0x0A0F0005
	.4byte 0x00000001
	.4byte data_085B9EE8
	.4byte 0x00000065
	.4byte 0x00000000
	.section .data.residue.08A5B0F8, "aw", %progbits
	.global EventListScr_Ch8_SelectUnit
EventListScr_Ch8_SelectUnit:
	.4byte 0x00000000
	.section .data.residue.08A5B0FC, "aw", %progbits
	.global EventListScr_Ch8_SelectDestination
EventListScr_Ch8_SelectDestination:
	.4byte 0x00000000
	.section .data.residue.08A5B100, "aw", %progbits
	.global EventListScr_Ch8_UnitMove
EventListScr_Ch8_UnitMove:
	.4byte 0x00000000
	.section .data.residue.08A5B104, "aw", %progbits
	.global EventListScr_Ch8_Tutorial
EventListScr_Ch8_Tutorial:
	.4byte 0x00000000
/* de-pointered slice data_08A5B090: ptr=2 data=28 skip=0 */
