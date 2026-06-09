	.syntax unified
	.section .text.BattleHitAdvance, "ax", %progbits
@ BattleHitAdvance @ JP 0x0802D1EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleHitAdvance
	.thumb_func
BattleHitAdvance:
	ldr r1, _0802D1F8 @ =0x0203A604
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	bx lr
	.align 2, 0
_0802D1F8: .4byte 0x0203A604

