	.syntax unified
	.set GetItemStatBonuses, 0x08017490 + 1
	.set UnitCheckStatCaps, 0x08017EDC + 1
	.set sub_801759C, 0x0801759C + 1
	.section .text.sub_80293B4, "ax", %progbits
@ sub_80293B4 @ JP 0x080293B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80293B4
	.thumb_func
sub_80293B4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl GetItemStatBonuses
	adds r4, r0, #0
	ldr r6, _080294A8 @ =0x03004BA0
	adds r0, r6, #0
	bl sub_801759C
	ldr r0, [r5]
	str r0, [r6]
	ldr r0, [r5, #4]
	str r0, [r6, #4]
	ldrb r0, [r4]
	ldrb r1, [r5, #0x12]
	adds r0, r0, r1
	strb r0, [r6, #0x12]
	ldrb r0, [r4, #1]
	ldrb r1, [r5, #0x14]
	adds r0, r0, r1
	strb r0, [r6, #0x14]
	ldrb r0, [r4, #2]
	ldrb r1, [r5, #0x15]
	adds r0, r0, r1
	strb r0, [r6, #0x15]
	ldrb r0, [r4, #3]
	ldrb r1, [r5, #0x16]
	adds r0, r0, r1
	strb r0, [r6, #0x16]
	ldrb r0, [r4, #4]
	ldrb r1, [r5, #0x17]
	adds r0, r0, r1
	strb r0, [r6, #0x17]
	ldrb r0, [r4, #5]
	ldrb r1, [r5, #0x18]
	adds r0, r0, r1
	strb r0, [r6, #0x18]
	ldrb r0, [r4, #6]
	ldrb r1, [r5, #0x19]
	adds r0, r0, r1
	strb r0, [r6, #0x19]
	ldrb r0, [r4, #7]
	ldrb r1, [r5, #0x1d]
	adds r0, r0, r1
	strb r0, [r6, #0x1d]
	ldrb r0, [r4, #8]
	ldrb r1, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r6, #0x1a]
	adds r0, r6, #0
	bl UnitCheckStatCaps
	movs r1, #0x12
	ldrsb r1, [r6, r1]
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r2, r0, #0x1f
	movs r1, #0x14
	ldrsb r1, [r6, r1]
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _0802943C
	movs r2, #1
_0802943C:
	movs r1, #0x15
	ldrsb r1, [r6, r1]
	movs r0, #0x15
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _0802944A
	movs r2, #1
_0802944A:
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08029458
	movs r2, #1
_08029458:
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08029466
	movs r2, #1
_08029466:
	movs r1, #0x18
	ldrsb r1, [r6, r1]
	movs r0, #0x18
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08029474
	movs r2, #1
_08029474:
	movs r1, #0x19
	ldrsb r1, [r6, r1]
	movs r0, #0x19
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08029482
	movs r2, #1
_08029482:
	movs r1, #0x1d
	ldrsb r1, [r6, r1]
	movs r0, #0x1d
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08029490
	movs r2, #1
_08029490:
	movs r1, #0x1a
	ldrsb r1, [r6, r1]
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _0802949E
	movs r2, #1
_0802949E:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080294A8: .4byte 0x03004BA0

