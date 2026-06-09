	.syntax unified
	.set BattleUpdateBattleStats, 0x0802B134 + 1
	.set sub_802B344, 0x0802B344 + 1
	.set sub_802B4CC, 0x0802B4CC + 1
	.set sub_802B554, 0x0802B554 + 1
	.section .text.sub_802B784, "ax", %progbits
@ sub_802B784 @ JP 0x0802B784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B784
	.thumb_func
sub_802B784:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _0802B81C @ =0x0203A568
	cmp r4, r6
	bne _0802B7AA
	ldr r0, _0802B820 @ =0x0203A604
	ldr r3, [r0]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_0802B7AA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleUpdateBattleStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802B4CC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802B344
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802B554
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802B7DA
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802B824
_0802B7DA:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r4, _0802B820 @ =0x0203A604
	ldr r2, [r4]
	ldr r1, [r2]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r3, [r2, #2]
	movs r5, #7
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0802B850
	ldr r3, [r4]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #4
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r5, #0
	b _0802B84A
	.align 2, 0
_0802B81C: .4byte 0x0203A568
_0802B820: .4byte 0x0203A604
_0802B824:
	adds r0, r5, #0
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	beq _0802B836
	cmp r0, #0xd
	bne _0802B860
_0802B836:
	ldr r4, _0802B85C @ =0x0203A604
	ldr r3, [r4]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
_0802B84A:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_0802B850:
	ldr r0, [r4]
	adds r0, #4
	str r0, [r4]
	movs r0, #1
	b _0802B86A
	.align 2, 0
_0802B85C: .4byte 0x0203A604
_0802B860:
	ldr r1, _0802B870 @ =0x0203A604
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r0, #0
_0802B86A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802B870: .4byte 0x0203A604

