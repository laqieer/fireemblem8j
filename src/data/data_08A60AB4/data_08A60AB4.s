/* Migrated from asm/data_08A60AB4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.08A60AB4, "aw", %progbits
	.global EventScr_WholeTowerClear
EventScr_WholeTowerClear:
	.4byte 0x00000D40
	.4byte DisplayCongratulationsMapAnim + 0x1
	.4byte 0x00000D40
	.4byte sub_8038320 + 0x1
	.4byte 0x00000D40
	.4byte UnlockPostgameAllyByClearCount + 0x1
	.4byte 0xFFFF2A21
	.4byte 0x00000120
/* de-pointered slice EventScr_WholeTowerClear: ptr=3 data=5 skip=0 */
