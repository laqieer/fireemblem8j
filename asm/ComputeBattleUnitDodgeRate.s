	.syntax unified
	.section .text.ComputeBattleUnitDodgeRate, "ax", %progbits
@ ComputeBattleUnitDodgeRate @ JP 0x0802ABC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ComputeBattleUnitDodgeRate
	.thumb_func
ComputeBattleUnitDodgeRate:
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, #0x68
	strh r1, [r0]
	bx lr
	.align 2, 0

