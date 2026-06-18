	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_8040EA8, 0x08040EA8 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_803AA9C, "ax", %progbits
@ AiFindTargetInReachNeglectWallByFunc @ JP 0x0803AA9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiFindTargetInReachNeglectWallByFunc
	.thumb_func
AiFindTargetInReachNeglectWallByFunc:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	str r1, [sp]
	movs r0, #0xff
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0803AAE0 @ =0x03004DF0
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8040EA8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _0803AAE4 @ =0x0202E4D0
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803AB58
	.align 2, 0
_0803AAE0: .4byte 0x03004DF0
_0803AAE4: .4byte 0x0202E4D0
_0803AAE8:
	ldr r0, _0803AB68 @ =0x0202E4D0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r1, r6, #1
	mov r8, r1
	cmp r4, #0
	blt _0803AB54
	ldr r7, _0803AB6C @ =0x0202E4E0
	lsls r5, r6, #2
_0803AAFE:
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AB4A
	ldr r0, _0803AB70 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803AB4A
	ldr r0, _0803AB74 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803AB4A
	adds r0, r1, #0
	bl GetUnit
	bl sub_80D65E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AB4A
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, sl
	bhi _0803AB4A
	adds r1, r0, #0
	mov sl, r1
	str r4, [sp, #4]
	str r6, [sp, #8]
_0803AB4A:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bge _0803AAFE
_0803AB54:
	mov r1, r8
	lsls r0, r1, #0x10
_0803AB58:
	asrs r6, r0, #0x10
	cmp r6, #0
	bge _0803AAE8
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _0803AB78
	movs r0, #0
	b _0803AB8A
	.align 2, 0
_0803AB68: .4byte 0x0202E4D0
_0803AB6C: .4byte 0x0202E4E0
_0803AB70: .4byte 0x0202E4D4
_0803AB74: .4byte 0x0202BE40
_0803AB78:
	mov r1, sp
	ldrh r0, [r1, #4]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1, #2]
	movs r0, #1
_0803AB8A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

