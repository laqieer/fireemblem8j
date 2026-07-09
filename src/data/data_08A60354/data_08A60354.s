/* byte-neutral SPLIT of EventScr_LoadUnitForDifferentMode into 11 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A60354, "aw", %progbits
	.global EventScr_LoadUnitForDifferentMode
EventScr_LoadUnitForDifferentMode:
	.4byte 0x00000C41
	.4byte 0x0000000C
	.4byte 0x00001922
	.4byte 0x00000C40
	.4byte 0x0000000C
	.4byte 0x00320620
	.4byte 0x00000820
	.4byte 0x004C0620
	.4byte 0x00000A40
	.4byte UnitDef_Ch14BAlly_7 + 0x30
	.4byte 0x00000120
	.section .data.residue.08A60380, "aw", %progbits
	.global EventScr_LoadUnitForTutorial
EventScr_LoadUnitForTutorial:
	.4byte 0x00001927
	.4byte 0x00000C41
	.4byte 0x0000000C
	.4byte 0x00001922
	.4byte 0x00000C40
	.4byte 0x0000000C
	.4byte 0x003C0620
	.4byte 0x00000A40
	.4byte UnitDef_Ch14BAlly_7 + 0x30
	.4byte 0x00000820
	.4byte 0x00000120
	.section .data.residue.08A603AC, "aw", %progbits
	.global EventScr_LoadReinforce
EventScr_LoadReinforce:
	.4byte 0x00041020
	.4byte 0x00000A40
	.4byte data_085B9BBC + 0x168
	.4byte 0x00090228
	.4byte 0x00012C40
	.4byte 0xFFFFFFFF
	.4byte 0x00003020
	.4byte 0x00090220
	.4byte 0x00001020
	.4byte 0x00000120
	.section .data.residue.08A603D4, "aw", %progbits
	.global EventScr_LoadReinforceHardMode
EventScr_LoadReinforceHardMode:
	.4byte 0x00001927
	.4byte 0x00000C41
	.4byte 0x0000000C
	.4byte 0x00001922
	.4byte 0x00000C40
	.4byte 0x0000000C
	.4byte 0x00000A40
	.4byte EventScr_LoadReinforce
	.4byte 0x00000820
	.4byte 0x00000120
	.section .data.residue.08A603FC, "aw", %progbits
	.global EventScr_TextShowWithFadeIn
EventScr_TextShowWithFadeIn:
	.4byte 0x00080320
	.4byte 0x80BD0C41
	.4byte 0x0000000C
	.4byte 0x00101721
	.4byte 0x80BD0820
	.4byte 0x00001A20
	.4byte 0x00002220
	.4byte 0x00101720
	.4byte 0x00000120
	.section .data.residue.08A60420, "aw", %progbits
	.global EventScr_SetBackground
EventScr_SetBackground:
	.4byte 0x00080320
	.4byte 0x80D20C41
	.4byte 0x0000000C
	.4byte 0x00101721
	.4byte 0x80D20820
	.4byte 0x00001A21
	.4byte 0xFFFF2140
	.4byte 0x00000000
	.4byte 0x00101720
	.4byte 0x00000120
	.section .data.residue.08A60448, "aw", %progbits
	.global Event_TextWithBG
Event_TextWithBG:
	.4byte 0x00000A40
	.4byte EventScr_SetBackground
	.4byte 0x00320620
	.4byte 0xFFFF1B20
	.4byte 0x00001D20
	.4byte 0x00000A40
	.4byte EventScr_TextShowWithFadeIn
	.4byte 0x00000120
	.section .data.residue.08A60468, "aw", %progbits
	.global EventScr_ApplyActiveUnitTileChange
EventScr_ApplyActiveUnitTileChange:
	.4byte 0x00011020
	.4byte 0xFFFE2720
	.4byte 0x00070228
	.4byte 0x00000120
	.section .data.residue.08A60478, "aw", %progbits
	.global EventScr_ApplyTileChangeForFactionIfAlly
EventScr_ApplyTileChangeForFactionIfAlly:
	.4byte 0x00020540
	.4byte 0x00000000
	.4byte 0x00000A40
	.4byte EventScr_ApplyTileChangeForFaction
	.4byte 0x00000120
	.section .data.residue.08A6048C, "aw", %progbits
	.global EventScr_ApplyTileChangeForFactionIfEnemy
EventScr_ApplyTileChangeForFactionIfEnemy:
	.4byte 0x00020540
	.4byte 0x00000002
	.4byte 0x00000A40
	.4byte EventScr_ApplyTileChangeForFaction
	.4byte 0x00000120
	.section .data.residue.08A604A0, "aw", %progbits
	.global EventScr_ApplyTileChangeForFactionIfNPC
EventScr_ApplyTileChangeForFactionIfNPC:
	.4byte 0x00020540
	.4byte 0x00000001
	.4byte 0x00000A40
	.4byte EventScr_ApplyTileChangeForFaction
	.4byte 0x00000120
/* de-pointered slice EventScr_LoadUnitForDifferentMode: ptr=9 data=79 skip=0 */
