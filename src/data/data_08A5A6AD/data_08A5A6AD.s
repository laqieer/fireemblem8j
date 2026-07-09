@ Descriptive assembly extracted from inline __asm__ in data_08A5A6AD.c (#152).
@ Byte-neutral SPLIT_PARTIAL: 3B LEAVE (gPadding_08A5A6AD, byte-completeness) + 7
@ named Prologue event lists. Directive stream preserved verbatim; the three
@ raw .byte runs that straddle a part boundary are broken at that byte (NO
@ .align, NO reordering). make compare is the oracle.

	.section .data.residue.08A5A6AD, "aw", %progbits
	.global gPadding_08A5A6AD
gPadding_08A5A6AD:
	.byte 0x00, 0x00, 0x00
	.section .data.residue.08A5A6B0, "aw", %progbits
	.global EventListScr_Prologue_Turn
EventListScr_Prologue_Turn:
	.byte 0x02, 0x00, 0x00, 0x00
	.4byte EventScr_Prologue_Turn1
	.byte 0x01, 0x00, 0x80, 0x00, 0x02, 0x00, 0x00, 0x00
	.4byte EventScr_Prologue_Turn2
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.4byte EventScr_Prologue_Turn3
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x08, 0x00
	.4byte EventScr_Prologue_ONeillAttack
	.byte 0x01, 0xFF, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.section .data.residue.08A5A6E4, "aw", %progbits
	.global EventListScr_Prologue_Character
EventListScr_Prologue_Character:
	.byte 0x00, 0x00, 0x00, 0x00
	.section .data.residue.08A5A6E8, "aw", %progbits
	.global EventListScr_Prologue_Location
EventListScr_Prologue_Location:
	.byte 0x00, 0x00, 0x00, 0x00
	.section .data.residue.08A5A6EC, "aw", %progbits
	.global EventListScr_Prologue_Misc
EventListScr_Prologue_Misc:
	.byte 0x01, 0x00, 0x03, 0x00
	.4byte EventScr_Prologue_EndingScene
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x00
	.4byte EventScr_Prologue_OneEnemyLeft
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.4byte EventScr_GameOver
	.byte 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.section .data.residue.08A5A714, "aw", %progbits
	.global EventListScr_Prologue_SelectUnit
EventListScr_Prologue_SelectUnit:
	.byte 0x00, 0x00, 0x00, 0x00
	.section .data.residue.08A5A718, "aw", %progbits
	.global EventListScr_Prologue_SelectDestination
EventListScr_Prologue_SelectDestination:
	.byte 0x00, 0x00, 0x00, 0x00
	.section .data.residue.08A5A71C, "aw", %progbits
	.global EventListScr_Prologue_UnitMove
EventListScr_Prologue_UnitMove:
	.byte 0x00, 0x00, 0x00, 0x00
