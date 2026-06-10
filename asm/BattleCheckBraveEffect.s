	.syntax unified
	.section .text.BattleCheckBraveEffect, "ax", %progbits
@ BattleCheckBraveEffect @ JP 0x0802B004 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleCheckBraveEffect
	.thumb_func
BattleCheckBraveEffect:
	push {lr}
	ldr r0, [r0, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802B034
	ldr r0, _0802B02C @ =0x0203A604
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x10
	orrs r1, r0
	ldr r0, _0802B030 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	movs r0, #1
	b _0802B036
	.align 2, 0
_0802B02C: .4byte 0x0203A604
_0802B030: .4byte 0xFFF80000
_0802B034:
	movs r0, #0
_0802B036:
	pop {r1}
	bx r1
	.align 2, 0

