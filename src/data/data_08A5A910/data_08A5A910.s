/* byte-neutral SPLIT of data_08A5A910 into 2 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A5A910, "aw", %progbits
	.global EventListScr_Ch2_Turn
EventListScr_Ch2_Turn:
	.4byte 0x00000002
	.4byte EventScr_Ch2_Turn1Player
	.4byte 0x00000001
	.4byte 0x00000002
	.4byte EventScr_Ch2_Turn2Player
	.4byte 0x00000002
	.4byte 0x00000002
	.4byte EventScr_Ch2_Village2 + 0x78
	.4byte 0x00000003
	.4byte 0x00000000
	.section .data.residue.08A5A938, "aw", %progbits
	.global EventListScr_Ch2_Character
EventListScr_Ch2_Character:
	.4byte 0x00070003
	.4byte EventScr_Ch2_Talk_EirikaRoss
	.4byte 0x00000701
	.4byte 0x00000000
	.4byte 0x00080003
	.4byte EventScr_Ch2_Talk_RossGarcia
	.4byte 0x00000A07
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice data_08A5A910: ptr=5 data=14 skip=0 */
