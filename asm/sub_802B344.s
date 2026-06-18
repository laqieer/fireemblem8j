	.syntax unified
	.set sub_802A490, 0x0802A490 + 1
	.set sub_802A4C0, 0x0802A4C0 + 1
	.set sub_802B164, 0x0802B164 + 1
	.set sub_802B1E8, 0x0802B1E8 + 1
	.set sub_802B258, 0x0802B258 + 1
	.set sub_802B2FC, 0x0802B2FC + 1
	.set sub_802B328, 0x0802B328 + 1
	.section .text.sub_802B344, "ax", %progbits
@ BattleGenerateHitAttributes @ JP 0x0802B344 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleGenerateHitAttributes
	.thumb_func
BattleGenerateHitAttributes:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r4, _0802B398 @ =0x0203A4D0
	movs r0, #0
	strh r0, [r4, #4]
	adds r0, r7, #0
	bl sub_802B164
	ldr r5, _0802B39C @ =0x0203A604
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B3A4
	ldrh r0, [r4, #0xa]
	movs r1, #1
	bl sub_802A4C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B3A4
	ldr r3, [r5]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #2
	orrs r1, r0
	ldr r0, _0802B3A0 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b _0802B4B2
	.align 2, 0
_0802B398: .4byte 0x0203A4D0
_0802B39C: .4byte 0x0203A604
_0802B3A0: .4byte 0xFFF80000
_0802B3A4:
	ldr r5, _0802B450 @ =0x0203A4D0
	movs r1, #6
	ldrsh r0, [r5, r1]
	mov sb, r0
	movs r0, #8
	ldrsh r4, [r5, r0]
	adds r0, r7, #0
	mov r1, r8
	bl sub_802B258
	ldr r6, _0802B454 @ =0x0203A604
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne _0802B3D6
	adds r0, r7, #0
	mov r1, r8
	bl sub_802B1E8
_0802B3D6:
	ldr r2, [r6]
	ldr r0, [r2]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0802B3EA
	movs r4, #0
_0802B3EA:
	mov r1, sb
	subs r0, r1, r4
	strh r0, [r5, #4]
	ldr r0, [r2]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _0802B402
	movs r0, #0
	strh r0, [r5, #4]
_0802B402:
	ldrh r0, [r5, #0xc]
	movs r1, #0
	bl sub_802A490
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0802B480
	adds r0, r7, #0
	mov r1, r8
	bl sub_802B2FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B460
	ldr r4, [r6]
	ldr r3, [r4]
	lsls r1, r3, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r1, r0
	ldr r2, _0802B458 @ =0xFFF80000
	adds r0, r2, #0
	ands r0, r3
	orrs r0, r1
	str r0, [r4]
	movs r0, #0x7f
	strh r0, [r5, #4]
	ldr r3, [r4]
	lsls r0, r3, #0xd
	lsrs r0, r0, #0xd
	ldr r1, _0802B45C @ =0xFFFF7FFF
	ands r0, r1
	ands r2, r3
	orrs r2, r0
	str r2, [r4]
	b _0802B480
	.align 2, 0
_0802B450: .4byte 0x0203A4D0
_0802B454: .4byte 0x0203A604
_0802B458: .4byte 0xFFF80000
_0802B45C: .4byte 0xFFFF7FFF
_0802B460:
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	orrs r1, r4
	ldr r0, _0802B4C0 @ =0x0007FFFF
	ands r1, r0
	ldr r0, _0802B4C4 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	movs r0, #4
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	strh r0, [r5, #4]
_0802B480:
	ldr r4, _0802B4C8 @ =0x0203A4D0
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _0802B48E
	movs r0, #0x7f
	strh r0, [r4, #4]
_0802B48E:
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0802B49A
	movs r0, #0
	strh r0, [r4, #4]
_0802B49A:
	adds r0, r7, #0
	mov r1, r8
	bl sub_802B328
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0802B4B2
	adds r1, r7, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_0802B4B2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B4C0: .4byte 0x0007FFFF
_0802B4C4: .4byte 0xFFF80000
_0802B4C8: .4byte 0x0203A4D0

