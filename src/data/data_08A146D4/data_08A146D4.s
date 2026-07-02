/* Migrated from asm/data_08A146D4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.08A146D4, "aw", %progbits
	.global data_08A146D4
data_08A146D4:
	.4byte 0x00000002
	.4byte SpellAssocResetPalMain + 0x1
	.4byte 0x0010000E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte BG0Shaker_Init + 0x1
	.4byte 0x00000003
	.4byte BG0Shaker_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte LockGame + 0x1
	.4byte 0x0001000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte MapAnimRotation_Init + 0x1
	.4byte 0x00000003
	.4byte MapAnimRotation_Main + 0x1
	.4byte 0x00000002
	.4byte UnlockGame + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice data_08A146D4: ptr=7 data=17 skip=0 */
