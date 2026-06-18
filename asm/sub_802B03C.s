	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_802B03C, "ax", %progbits
@ BattleCheckTriangleAttack @ JP 0x0802B03C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleCheckTriangleAttack
	.thumb_func
BattleCheckTriangleAttack:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0802B0F8 @ =0x080DC96C
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r7, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r6, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r6, r0
	movs r0, #0xc0
	lsls r0, r0, #0xf
	ands r6, r0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	mov sl, r0
	ldrb r5, [r5, #0x11]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	mov sb, r5
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r0, #0xc0
	ands r3, r0
	ldr r0, _0802B0FC @ =0x0203A4D0
	str r7, [r0, #0x10]
	str r7, [r0, #0x14]
	mov r5, sp
	movs r0, #3
	mov r8, r0
_0802B08A:
	movs r0, #1
	ldrsb r0, [r5, r0]
	add r0, sb
	ldr r1, _0802B100 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	add r1, sl
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _0802B10C
	adds r0, r4, #0
	str r3, [sp, #8]
	bl GetUnit
	adds r2, r0, #0
	movs r0, #0xc0
	ands r4, r0
	ldr r3, [sp, #8]
	cmp r4, r3
	bne _0802B10C
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0802B10C
	cmp r1, #0xb
	beq _0802B10C
	cmp r1, #0xd
	beq _0802B10C
	ldr r1, [r2, #4]
	ldrb r0, [r1, #4]
	cmp r0, #0x24
	beq _0802B10C
	ldr r0, [r2]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r6
	cmp r0, #0
	beq _0802B10C
	adds r7, #1
	ldr r1, _0802B0FC @ =0x0203A4D0
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _0802B104
	str r2, [r1, #0x10]
	b _0802B10C
	.align 2, 0
_0802B0F8: .4byte 0x080DC96C
_0802B0FC: .4byte 0x0203A4D0
_0802B100: .4byte 0x0202E4D4
_0802B104:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0802B10C
	str r2, [r1, #0x14]
_0802B10C:
	adds r5, #2
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r0, r8
	cmp r0, #0
	bge _0802B08A
	movs r0, #0
	cmp r7, #1
	ble _0802B122
	movs r0, #1
_0802B122:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

