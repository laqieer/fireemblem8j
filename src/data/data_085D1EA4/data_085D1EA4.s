/* Migrated from asm/data_085D1EA4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
/* First 24 B (0x5D1EA4-0x5D1EBC) carved as cp_decide.o(.data) sDecideFuncList; tail kept here. */
	.section .data.residue.085D1EBC, "aw", %progbits
	.global data_085D1EBC
data_085D1EBC:
	.4byte DecideSpecialItems + 0x1
	.4byte DecideScriptA + 0x1
	.4byte DecideHealOrEscape + 0x1
	.4byte DecideScriptB + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000001
	.4byte data_080DCDAC
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte CpDecide_Main + 0x1
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte CpDecide_Suspend + 0x1
	.4byte 0x0000000C
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice data_085D1EBC: ptr=5 data=13 skip=2 */
