	.section .text.s_0802A5D4, "ax", %progbits
@ InitBattleUnitWithoutBonuses region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0802A5D4..0x0802A60C
	.thumb
	.align 2, 0
	.global InitBattleUnitWithoutBonuses
	.thumb_func
InitBattleUnitWithoutBonuses:
	.incbin "baserom.gba", 0x2A5D4, 0x38

	.section .text.s_0802ABD0, "ax", %progbits
@ ComputeBattleUnitEffectiveHitRate region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0802ABD0..0x0802AC00
	.thumb
	.align 2, 0
	.global ComputeBattleUnitEffectiveHitRate
	.thumb_func
ComputeBattleUnitEffectiveHitRate:
	.incbin "baserom.gba", 0x2ABD0, 0x30

	.section .text.s_0802BE6C, "ax", %progbits
@ CheckBattleUnitStatCaps region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0802BE6C..0x0802BF70
	.thumb
	.align 2, 0
	.global CheckBattleUnitStatCaps
	.thumb_func
CheckBattleUnitStatCaps:
	.incbin "baserom.gba", 0x2BE6C, 0x104

	.section .text.s_0802C428, "ax", %progbits
@ ModifyUnitSpecialExp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0802C428..0x0802C46C
	.thumb
	.align 2, 0
	.global ModifyUnitSpecialExp
	.thumb_func
ModifyUnitSpecialExp:
	.incbin "baserom.gba", 0x2C428, 0x44

	.section .text.s_0802C678, "ax", %progbits
@ BattleUnitTargetCheckCanCounter region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0802C678..0x0802C6A4
	.thumb
	.align 2, 0
	.global BattleUnitTargetCheckCanCounter
	.thumb_func
BattleUnitTargetCheckCanCounter:
	.incbin "baserom.gba", 0x2C678, 0x2C

