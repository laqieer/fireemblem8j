/* Migrated from asm/data_08A607B4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.08A607B4, "aw", %progbits
	.global EventScr_ChangeAIinQueue
EventScr_ChangeAIinQueue:
	.4byte 0x00000820
	.4byte 0x00010C44
	.4byte 0x0000000D
	.4byte 0x00210620
	.4byte 0x000B0722
	.4byte 0xFFFF3921
	.4byte 0x00000920
	.4byte 0x00010820
	.4byte 0x00000120
	.section .data.residue.08A607D8, "aw", %progbits
	.global EventScr_9EE6A0
EventScr_9EE6A0:
	.4byte 0x00000C41
	.4byte 0x0003000C
	.4byte 0x00000A40
	.4byte EventScr_ChangeAIinQueue
	.4byte 0x00010920
	.4byte 0x00000820
	.4byte 0x00420620
	.4byte 0xFFFF0221
	.4byte 0x00010820
	.4byte 0x00000120
/* de-pointered slice EventScr_9EE6A0: ptr=1 data=9 skip=0 */
	.section .data.residue.08A60800, "aw", %progbits
	.global EventScr_9EE6C8
EventScr_9EE6C8:
	.4byte 0x00002E21
	.4byte 0x00000C41
	.4byte 0x0003000C
	.4byte 0x00000A40
	.4byte EventScr_ChangeAIinQueue
	.4byte 0x00010920
	.4byte 0x00000820
	.4byte 0x00420620
	.4byte 0xFFFF0221
	.4byte 0x00010820
	.4byte 0x00000120
/* de-pointered slice EventScr_9EE6C8: ptr=1 data=10 skip=0 */
