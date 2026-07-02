/* Migrated from asm/data_085C33C0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.085C33C0, "aw", %progbits
	.global gProcScr_PhaseIntroSquares
gProcScr_PhaseIntroSquares:
	.4byte 0x00000002
	.4byte PhaseIntroBlendBox_Init + 0x1
	.4byte 0x00000003
	.4byte PhaseIntroSquares_InLoop + 0x1
	.4byte 0x00000003
	.4byte PhaseIntroSquares_OutLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice gProcScr_PhaseIntroSquares: ptr=3 data=5 skip=0 */
	.section .data.residue.085C33E0, "aw", %progbits
	.global gProcScr_PhaseIntroBlendBox
gProcScr_PhaseIntroBlendBox:
	.4byte 0x00000002
	.4byte PhaseIntroSquares_Init + 0x1
	.4byte 0x00000003
	.4byte PhaseIntroBlendBox_InLoop + 0x1
	.4byte 0x00000003
	.4byte PhaseIntroBlendBox_OutLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice gProcScr_PhaseIntroBlendBox: ptr=3 data=5 skip=0 */
