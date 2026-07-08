@ byte-neutral SPLIT of data_085C2980 into 12 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.085C2980, "a", %progbits
	.global sSprite_SysUpArrowA
sSprite_SysUpArrowA:
	.incbin "data/residual/data_085C2980.bin", 0x0, 0x8
	.section .data.residue.085C2988, "a", %progbits
	.global sSprite_SysUpArrowB
sSprite_SysUpArrowB:
	.incbin "data/residual/data_085C2980.bin", 0x8, 0x8
	.section .data.residue.085C2990, "a", %progbits
	.global sSprite_SysUpArrowC
sSprite_SysUpArrowC:
	.incbin "data/residual/data_085C2980.bin", 0x10, 0x8
	.section .data.residue.085C2998, "a", %progbits
	.global sSprite_SysDownArrowA
sSprite_SysDownArrowA:
	.incbin "data/residual/data_085C2980.bin", 0x18, 0x8
	.section .data.residue.085C29A0, "a", %progbits
	.global sSprite_SysDownArrowB
sSprite_SysDownArrowB:
	.incbin "data/residual/data_085C2980.bin", 0x20, 0x8
	.section .data.residue.085C29A8, "a", %progbits
	.global sSprite_SysDownArrowC
sSprite_SysDownArrowC:
	.incbin "data/residual/data_085C2980.bin", 0x28, 0x8
	.section .data.residue.085C29B0, "a", %progbits
	.global gSysUpArrowSpriteLut
gSysUpArrowSpriteLut:
	.incbin "data/residual/data_085C2980.bin", 0x30, 0xC
	.section .data.residue.085C29BC, "a", %progbits
	.global gSysDownArrowSpriteLut
gSysDownArrowSpriteLut:
	.incbin "data/residual/data_085C2980.bin", 0x3C, 0xC
	.section .data.residue.085C29C8, "a", %progbits
	.global ProcScr_CamMove
ProcScr_CamMove:
	.incbin "data/residual/data_085C2980.bin", 0x48, 0x28
	.section .data.residue.085C29F0, "a", %progbits
	.global ProcScr_UnkMapCursor
ProcScr_UnkMapCursor:
	.incbin "data/residual/data_085C2980.bin", 0x70, 0x10
	.section .data.residue.085C2A00, "a", %progbits
	.global gProcScr_Bm_0
gProcScr_Bm_0:
	.incbin "data/residual/data_085C2980.bin", 0x80, 0x18
	.section .data.residue.085C2A18, "a", %progbits
	.global sStatusNameTextIdLookup
sStatusNameTextIdLookup:
	.incbin "data/residual/data_085C2980.bin", 0x98, 0x38
