	.syntax unified
	.set GetItemAfterUse, 0x08016894 + 1
	.set GetItemWeaponEffect, 0x080174CC + 1
	.set sub_802A490, 0x0802A490 + 1
	.section .text.sub_802B554, "ax", %progbits
@ BattleGenerateHitEffects @ JP 0x0802B554 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleGenerateHitEffects
	.thumb_func
BattleGenerateHitEffects:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r5, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r6, _0802B594 @ =0x0203A604
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B578
	b _0802B732
_0802B578:
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	adds r7, r5, #0
	adds r7, #0x48
	cmp r0, #0x66
	beq _0802B5EA
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _0802B598
	cmp r0, #3
	beq _0802B5D4
	b _0802B5EA
	.align 2, 0
_0802B594: .4byte 0x0203A604
_0802B598:
	adds r1, r4, #0
	adds r1, #0x6f
	strb r0, [r1]
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x40
	orrs r1, r0
	ldr r0, _0802B5D0 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0802B5C4
	cmp r1, #0xd
	bne _0802B5EA
_0802B5C4:
	ldr r0, [r4, #0xc]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	b _0802B5EA
	.align 2, 0
_0802B5D0: .4byte 0xFFF80000
_0802B5D4:
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r1, r0
	ldr r0, _0802B638 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B5EA:
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #4
	bne _0802B644
	movs r1, #0x19
	ldrsb r1, [r5, r1]
	movs r0, #0x1f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_802A490
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B644
	ldr r0, _0802B63C @ =0x0203A604
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	orrs r1, r0
	ldr r0, _0802B638 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	ldr r0, _0802B640 @ =0x0203A4D0
	ldrb r1, [r0, #4]
	ldrb r0, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802B666
	movs r0, #0
	strb r0, [r5, #0x13]
	b _0802B666
	.align 2, 0
_0802B638: .4byte 0xFFF80000
_0802B63C: .4byte 0x0203A604
_0802B640: .4byte 0x0203A4D0
_0802B644:
	ldr r1, _0802B6C0 @ =0x0203A4D0
	movs r2, #0x13
	ldrsb r2, [r4, r2]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _0802B654
	strh r2, [r1, #4]
_0802B654:
	ldrb r1, [r1, #4]
	ldrb r0, [r4, #0x13]
	subs r0, r0, r1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802B666
	movs r0, #0
	strb r0, [r4, #0x13]
_0802B666:
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #2
	bne _0802B6A2
	ldr r0, _0802B6C0 @ =0x0203A4D0
	ldrb r0, [r0, #4]
	ldrb r1, [r5, #0x13]
	adds r0, r0, r1
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r5, #0x12]
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	cmp r0, r1
	ble _0802B68A
	strb r2, [r5, #0x13]
_0802B68A:
	ldr r0, _0802B6C4 @ =0x0203A604
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
	ldr r0, _0802B6C8 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B6A2:
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #5
	bne _0802B732
	ldr r0, _0802B6CC @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0802B6FE
	cmp r0, #0x40
	bgt _0802B6D0
	cmp r0, #0
	beq _0802B6D6
	b _0802B71A
	.align 2, 0
_0802B6C0: .4byte 0x0203A4D0
_0802B6C4: .4byte 0x0203A604
_0802B6C8: .4byte 0xFFF80000
_0802B6CC: .4byte 0x0202BCEC
_0802B6D0:
	cmp r0, #0x80
	beq _0802B6EA
	b _0802B71A
_0802B6D6:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802B712
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802B718
_0802B6EA:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802B712
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802B718
_0802B6FE:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _0802B712
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802B718
_0802B712:
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xb
_0802B718:
	strb r0, [r1]
_0802B71A:
	ldr r0, _0802B778 @ =0x0203A604
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	ldr r0, _0802B77C @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B732:
	ldr r2, _0802B778 @ =0x0203A604
	ldr r1, [r2]
	ldr r0, _0802B780 @ =0x0203A4D0
	ldrh r0, [r0, #4]
	strb r0, [r1, #3]
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B756
	ldr r0, [r5, #0x4c]
	movs r1, #0x82
	ands r0, r1
	cmp r0, #0
	beq _0802B770
_0802B756:
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl GetItemAfterUse
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802B770
	adds r1, r5, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_0802B770:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B778: .4byte 0x0203A604
_0802B77C: .4byte 0xFFF80000
_0802B780: .4byte 0x0203A4D0

