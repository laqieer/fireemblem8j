/* Migrated from asm/data_08A157AC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.08A157AC, "aw", %progbits
	.global ProcScr_EggDmgMapEffect2
ProcScr_EggDmgMapEffect2:
	.4byte 0x00000002
	.4byte MapAnim_MoveCameraOnTarget + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte MapAnim_StartGorgonHatchConditional + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x0032000E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice ProcScr_EggDmgMapEffect2: ptr=2 data=10 skip=0 */
	.section .data.residue.08A157DC, "aw", %progbits
	.global ProcScr_CritAtkMapEffect
ProcScr_CritAtkMapEffect:
	.4byte 0x00000002
	.4byte MapAnim_MoveCameraOnTarget + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte MapAnim_BeginRoundSpecificAnims + 0x1
	.4byte 0x001E000E
	.4byte 0x00000000
	.4byte 0x00000003
	.4byte MapAnim_WaitForHPToEndChangingMaybe + 0x1
	.4byte 0x0014000E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice ProcScr_CritAtkMapEffect: ptr=3 data=11 skip=0 */
