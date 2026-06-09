	.syntax unified
	.section .text.BattleIsTriangleAttack, "ax", %progbits
@ BattleIsTriangleAttack @ JP 0x0802CDC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleIsTriangleAttack
	.thumb_func
BattleIsTriangleAttack:
	ldr r0, _0802CDD0 @ =0x0203A5E8
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x17
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0802CDD0: .4byte 0x0203A5E8

