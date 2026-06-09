	.syntax unified
	.set BattleApplyReaverEffect, 0x0802C6A4 + 1
	.section .text.BattleApplyWeaponTriangleEffect, "ax", %progbits
@ BattleApplyWeaponTriangleEffect @ JP 0x0802C6F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleApplyWeaponTriangleEffect
	.thumb_func
BattleApplyWeaponTriangleEffect:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0802C704 @ =0x085C3F70
	b _0802C74A
	.align 2, 0
_0802C704: .4byte 0x085C3F70
_0802C708:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0802C748
	adds r0, r5, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0802C748
	ldrb r0, [r2, #2]
	adds r1, r4, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r1, [r2, #3]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldrb r0, [r2, #2]
	rsbs r0, r0, #0
	adds r1, r5, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r0, [r2, #3]
	rsbs r0, r0, #0
	adds r1, #1
	strb r0, [r1]
	b _0802C752
_0802C748:
	adds r2, #4
_0802C74A:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0802C708
_0802C752:
	ldr r0, [r4, #0x4c]
	movs r6, #0x80
	lsls r6, r6, #1
	ands r0, r6
	cmp r0, #0
	beq _0802C766
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleApplyReaverEffect
_0802C766:
	ldr r0, [r5, #0x4c]
	ands r0, r6
	cmp r0, #0
	beq _0802C776
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleApplyReaverEffect
_0802C776:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

