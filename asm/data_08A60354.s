@ byte-neutral SPLIT of data_08A60354 into 11 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A60354, "a", %progbits
	.global data_08A60354
data_08A60354:
	.incbin "data/residual/data_08A60354.bin", 0x0, 0x2C
	.section .data.residue.08A60380, "a", %progbits
	.global EventScr_LoadUnitForTutorial
EventScr_LoadUnitForTutorial:
	.incbin "data/residual/data_08A60354.bin", 0x2C, 0x2C
	.section .data.residue.08A603AC, "a", %progbits
	.global EventScr_LoadReinforce
EventScr_LoadReinforce:
	.incbin "data/residual/data_08A60354.bin", 0x58, 0x28
	.section .data.residue.08A603D4, "a", %progbits
	.global EventScr_LoadReinforceHardMode
EventScr_LoadReinforceHardMode:
	.incbin "data/residual/data_08A60354.bin", 0x80, 0x28
	.section .data.residue.08A603FC, "a", %progbits
	.global EventScr_TextShowWithFadeIn
EventScr_TextShowWithFadeIn:
	.incbin "data/residual/data_08A60354.bin", 0xA8, 0x24
	.section .data.residue.08A60420, "a", %progbits
	.global EventScr_SetBackground
EventScr_SetBackground:
	.incbin "data/residual/data_08A60354.bin", 0xCC, 0x28
	.section .data.residue.08A60448, "a", %progbits
	.global Event_TextWithBG
Event_TextWithBG:
	.incbin "data/residual/data_08A60354.bin", 0xF4, 0x20
	.section .data.residue.08A60468, "a", %progbits
	.global EventScr_ApplyActiveUnitTileChange
EventScr_ApplyActiveUnitTileChange:
	.incbin "data/residual/data_08A60354.bin", 0x114, 0x10
	.section .data.residue.08A60478, "a", %progbits
	.global EventScr_ApplyTileChangeForFactionIfAlly
EventScr_ApplyTileChangeForFactionIfAlly:
	.incbin "data/residual/data_08A60354.bin", 0x124, 0x14
	.section .data.residue.08A6048C, "a", %progbits
	.global EventScr_ApplyTileChangeForFactionIfEnemy
EventScr_ApplyTileChangeForFactionIfEnemy:
	.incbin "data/residual/data_08A60354.bin", 0x138, 0x14
	.section .data.residue.08A604A0, "a", %progbits
	.global EventScr_ApplyTileChangeForFactionIfNPC
EventScr_ApplyTileChangeForFactionIfNPC:
	.incbin "data/residual/data_08A60354.bin", 0x14C, 0x14
