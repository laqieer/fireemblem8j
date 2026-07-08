/* byte-neutral SPLIT of data_08A614C0 into 3 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A614C0, "aw", %progbits
	.global EventScr_Prologue_Tutorial2
EventScr_Prologue_Tutorial2:
	.4byte 0x00070228
	.4byte 0x00010B41
	.4byte EventScr_Prologue_Tutorial3
	.4byte 0x00000120
	.section .data.residue.08A614D0, "aw", %progbits
	.global EventScr_Prologue_Tutorial3
EventScr_Prologue_Tutorial3:
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00000A40
	.4byte EventScr_Prologue_GiveRapier
	.4byte 0x00023426
	.4byte 0x00B70229
	.4byte 0x00000120
	.section .data.residue.08A614EC, "aw", %progbits
	.global EventScr_Prologue_TutMessageTurn1
EventScr_Prologue_TutMessageTurn1:
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x08DD1B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00B40229
	.4byte 0x00B50229
	.4byte 0x00000120
/* de-pointered slice data_08A614C0: ptr=2 data=17 skip=1 */
