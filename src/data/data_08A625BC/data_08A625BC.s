/* Migrated from asm/data_08A625BC.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.08A625BC, "aw", %progbits
	.global EventScr_Ch2_Turn1Player
EventScr_Ch2_Turn1Player:
	.4byte 0x00020540
	.4byte data_08A62808 + 0x100
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
/* de-pointered slice EventScr_Ch2_Turn1Player: ptr=2 data=4 skip=0 */
	.section .data.residue.08A625D4, "aw", %progbits
	.global EventScr_Ch2_Turn2Player
EventScr_Ch2_Turn2Player:
	.4byte 0x00020540
	.4byte EventScr_Ch2_5
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
/* de-pointered slice EventScr_Ch2_Turn2Player: ptr=2 data=4 skip=0 */
