/* Migrated from asm/data_085C6770.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.085C6770, "aw", %progbits
	.global sProcScr_StatusHealEffect_OverlayBg
sProcScr_StatusHealEffect_OverlayBg:
	.4byte 0x00000002
	.4byte StatusHealEffect_OverlayBg_Init + 0x1
	.4byte 0x00000003
	.4byte StatusHealEffect_OverlayBg_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice sProcScr_StatusHealEffect_OverlayBg: ptr=2 data=4 skip=0 */
	.section .data.residue.085C6788, "aw", %progbits
	.global sProcScr_StatusHealEffect_BlendedSprite
sProcScr_StatusHealEffect_BlendedSprite:
	.4byte 0x00000002
	.4byte StatusHealEffect_BlendedSprite_Init + 0x1
	.4byte 0x00000003
	.4byte StatusHealEffect_BlendedSprite_Loop + 0x1
	.4byte 0x00000002
	.4byte StatusHealEffect_BlendedSprite_Finish + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice sProcScr_StatusHealEffect_BlendedSprite: ptr=3 data=5 skip=0 */
	.section .data.residue.085C67A8, "aw", %progbits
	.global sProcScr_StatusHealEffect_BlendAnim
sProcScr_StatusHealEffect_BlendAnim:
	.4byte 0x00000002
	.4byte StatusHealEffect_BlendSpriteAnim_InitIn + 0x1
	.4byte 0x00000003
	.4byte StatusHealEffect_BlendSpriteAnim_Loop + 0x1
	.4byte 0x0020000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte StatusHealEffect_BlendSpriteAnim_InitOut + 0x1
	.4byte 0x00000003
	.4byte StatusHealEffect_BlendSpriteAnim_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice sProcScr_StatusHealEffect_BlendAnim: ptr=4 data=8 skip=0 */
	.section .data.residue.085C67D8, "aw", %progbits
	.global sProcScr_StatusHealEffect_PalAnim
sProcScr_StatusHealEffect_PalAnim:
	.4byte 0x00000002
	.4byte StatusHealEffect_PalSpriteAnim_Init + 0x1
	.4byte 0x00000003
	.4byte StatusHealEffect_PalSpriteAnim_LoopIn + 0x1
	.4byte 0x00000003
	.4byte StatusHealEffect_PalSpriteAnim_LoopOut + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice sProcScr_StatusHealEffect_PalAnim: ptr=3 data=5 skip=0 */
	.section .data.residue.085C67F8, "aw", %progbits
	.global sProcScr_StatusHealEffect
sProcScr_StatusHealEffect:
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_OverlayBg
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_BlendedSprite
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_BlendAnim
	.4byte 0x00000005
	.4byte sProcScr_StatusHealEffect_PalAnim
	.4byte 0x0042000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte StatusHealEffect_Finish + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice sProcScr_StatusHealEffect: ptr=5 data=9 skip=0 */
