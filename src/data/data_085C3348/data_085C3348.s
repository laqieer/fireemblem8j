/* Migrated from asm/data_085C3348.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.085C3348, "aw", %progbits
	.global data_085C3348
data_085C3348:
	.4byte 0x41000005
	.4byte 0x0000C000
	.4byte 0xC0404100
	.4byte 0x41000008
	.4byte 0x0010C080
	.4byte 0x80C00100
	.4byte 0x81000018
	.4byte 0x001C80E0
	.section .data.residue.085C3368, "aw", %progbits
	.global gProcScr_PhaseIntroUnk
gProcScr_PhaseIntroUnk:
	.4byte 0x00000002
	.4byte PhaseIntroUnk_Init + 0x1
	.4byte 0x00000003
	.4byte PhaseIntroUnk_Loop + 0x1
/* de-pointered slice data_085C3348: ptr=2 data=10 skip=0 */
