/* Migrated from asm/dat_lut_29_ref.s. The GCC label `lut.29` (invalid C identifier)
 * is unreferenced; the only consumer (SubtitleHelp_Loop.c) uses the descriptive
 * alias SubtitleHelp_TextShowLut, so define the bytes directly under that name.
 *
 * #148: the 56-byte gProcScr_SubtitleHelp proc script that was de-pointered and
 * embedded here at +8 (between the two show luts) is carved out to a typed
 * struct ProcCmd[] in src/data/ProcScr_SubtitleHelp148_ref. This file now emits
 * only the two raw 8-byte show luts + the still-opaque second proc script
 * data_085C66D8 (consumed by sub_803581C.c), split into two sections so the
 * typed table can be placed between them by the layout:
 *   .rodata.dat_lut_29_ref       [5C6690,5C6698)  SubtitleHelp_TextShowLut (8 B lut)
 *   (gProcScr_SubtitleHelp        [5C6698,5C66D0)  -> the new typed table)
 *   .rodata.dat_lut_29_ref_tail  [5C66D0,5C6770)  lut2 (8 B) + data_085C66D8 proc
 * data_085C66D8 keeps its de-pointered fn-ptr relocations; the PROC_NAME data ref
 * (gProcScr_SALLYCURSOR_pool+0x2E, interior-within-size) stays a relocation so it is shiftable. */
	.section .rodata.dat_lut_29_ref, "a", %progbits
	.global SubtitleHelp_TextShowLut
SubtitleHelp_TextShowLut:
	.4byte 0x94929190
	.4byte 0x009C9996
	.section .rodata.dat_lut_29_ref_tail, "a", %progbits
	.4byte 0x92908F8E
	.4byte 0x009A9794
	.global data_085C66D8
data_085C66D8:
	.4byte 0x00000001
	.4byte gProcScr_SALLYCURSOR_pool + 0x2E
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
