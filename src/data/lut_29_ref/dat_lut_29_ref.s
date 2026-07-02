/* Migrated from asm/dat_lut_29_ref.s. The GCC label `lut.29` (invalid C identifier)
 * is unreferenced; the only consumer (SubtitleHelp_Loop.c) uses the descriptive
 * alias SubtitleHelp_TextShowLut, so define the bytes directly under that name. */
/* De-pointered ProcScr SubtitleHelp_TextShowLut: proc callback fn pointers
 * (SubtitleHelp_OnEnd/Init/Loop, thumb-bit +0x1) + a data ref (data_080DCCB2+0x2E,
 * interior-within-size) -> relocations so the proc script is shiftable. */
	.section .rodata.dat_lut_29_ref, "a", %progbits
	.global SubtitleHelp_TextShowLut
SubtitleHelp_TextShowLut:
	.4byte 0x94929190
	.4byte 0x009C9996
	.4byte 0x00000001
	.4byte data_080DCCB2 + 0x2E
	.4byte 0x00000015
	.4byte 0x00000000
	.4byte 0x00000004
	.4byte SubtitleHelp_OnEnd + 0x1
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte SubtitleHelp_Init + 0x1
	.4byte 0x00000003
	.4byte SubtitleHelp_Loop + 0x1
	.4byte 0x00000010
	.4byte 0x00000000
	.4byte 0x92908F8E
	.4byte 0x009A9794
	.section .rodata.dat_lut_29_ref, "a", %progbits
	.global data_085C66D8
data_085C66D8:
	.4byte 0x00000001
	.4byte data_080DCCB2 + 0x2E
	.4byte 0x00000015
	.4byte 0x00000000
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte sub_8035650 + 0x1
	.4byte 0x00000003
	.4byte sub_80357BC + 0x1
	.4byte 0x00000002
	.4byte SubtitleHelp_OnEnd + 0x1
	.4byte 0x0008000E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte KillAllRedUnits_Init + 0x1
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x00000003
	.4byte KillAllRedUnits_Loop + 0x1
	.4byte 0x0020000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte EndAllMus + 0x1
	.4byte 0x0000000C
	.4byte 0x00000000
	.4byte 0x0063000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte RefreshEntityBmMaps + 0x1
	.4byte 0x00000002
	.4byte RenderBmMap + 0x1
	.4byte 0x00000002
	.4byte RefreshUnitSprites + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice data_085C66D8: ptr=7 data=28 skip=3 */
