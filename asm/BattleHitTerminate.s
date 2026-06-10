	.syntax unified
	.section .text.BattleHitTerminate, "ax", %progbits
@ BattleHitTerminate @ JP 0x0802D1FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleHitTerminate
	.thumb_func
BattleHitTerminate:
	ldr r0, _0802D214 @ =0x0203A604
	ldr r2, [r0]
	adds r2, #4
	str r2, [r0]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	bx lr
	.align 2, 0
_0802D214: .4byte 0x0203A604

