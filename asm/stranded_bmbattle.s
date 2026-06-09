	.section .text.s_0802A5D4, "ax", %progbits
@ InitBattleUnitWithoutBonuses region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0802A5D4..0x0802A60C
	.thumb
	.align 2, 0
	.global InitBattleUnitWithoutBonuses
	.thumb_func
InitBattleUnitWithoutBonuses:
	.incbin "baserom.gba", 0x2A5D4, 0x38

