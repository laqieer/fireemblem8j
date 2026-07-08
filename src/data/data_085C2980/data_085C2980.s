/* byte-neutral SPLIT of data_085C2980 into 12 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.085C2980, "aw", %progbits
	.global sSprite_SysUpArrowA
sSprite_SysUpArrowA:
	.4byte 0x80000001
	.4byte 0x004C0000
	.section .data.residue.085C2988, "aw", %progbits
	.global sSprite_SysUpArrowB
sSprite_SysUpArrowB:
	.4byte 0x80000001
	.4byte 0x004D0000
	.section .data.residue.085C2990, "aw", %progbits
	.global sSprite_SysUpArrowC
sSprite_SysUpArrowC:
	.4byte 0x80FF0001
	.4byte 0x004D0000
	.section .data.residue.085C2998, "aw", %progbits
	.global sSprite_SysDownArrowA
sSprite_SysDownArrowA:
	.4byte 0x80000001
	.4byte 0x004E0000
	.section .data.residue.085C29A0, "aw", %progbits
	.global sSprite_SysDownArrowB
sSprite_SysDownArrowB:
	.4byte 0x80000001
	.4byte 0x004F0000
	.section .data.residue.085C29A8, "aw", %progbits
	.global sSprite_SysDownArrowC
sSprite_SysDownArrowC:
	.4byte 0x80010001
	.4byte 0x004F0000
	.section .data.residue.085C29B0, "aw", %progbits
	.global gSysUpArrowSpriteLut
gSysUpArrowSpriteLut:
	.4byte sSprite_SysUpArrowA
	.4byte sSprite_SysUpArrowB
	.4byte sSprite_SysUpArrowC
	.section .data.residue.085C29BC, "aw", %progbits
	.global gSysDownArrowSpriteLut
gSysDownArrowSpriteLut:
	.4byte sSprite_SysDownArrowA
	.4byte sSprite_SysDownArrowB
	.4byte sSprite_SysDownArrowC
	.section .data.residue.085C29C8, "aw", %progbits
	.global ProcScr_CamMove
ProcScr_CamMove:
	.4byte 0x00000001
	.4byte frontier_df4_misc_lo_000b2_0DC583 + 0x7D
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte CamMove_OnInit + 0x1
	.4byte 0x00000003
	.4byte CamMove_OnLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.085C29F0, "aw", %progbits
	.global ProcScr_UnkMapCursor
ProcScr_UnkMapCursor:
	.4byte 0x00000003
	.4byte UnkMapCursor_OnLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.085C2A00, "aw", %progbits
	.global gProcScr_Bm_0
gProcScr_Bm_0:
	.4byte 0x00000004
	.4byte nullsub_33 + 0x1
	.4byte 0x00000003
	.4byte CamMoveLinear_OnLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.085C2A18, "aw", %progbits
	.global sStatusNameTextIdLookup
sStatusNameTextIdLookup:
	.4byte 0x000004C6
	.4byte 0x000004A3
	.4byte 0x000004A4
	.4byte 0x000004A5
	.4byte 0x000004A6
	.4byte 0x000004AA
	.4byte 0x000004AB
	.4byte 0x000004AC
	.4byte 0x000004AD
	.4byte 0x000004A7
	.4byte 0x000004A8
	.4byte 0x000004A9
	.4byte 0x00000000
	.4byte 0x000004A9
/* de-pointered slice data_085C2980: ptr=12 data=40 skip=0 */
