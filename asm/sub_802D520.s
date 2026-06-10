	.syntax unified
	.set TradeMenu_GetAdjustedRow, 0x0802D370 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_802D520, "ax", %progbits
@ sub_802D520 @ JP 0x0802D520 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D520
	.thumb_func
sub_802D520:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r0, _0802D65C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802D56C
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #1
	bne _0802D56C
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl TradeMenu_GetAdjustedRow
	adds r1, r0, #0
	cmp r1, #0
	bge _0802D554
	b _0802D652
_0802D554:
	strb r7, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802D660 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D56C
	movs r0, #0x67
	bl m4aSongNumStart
_0802D56C:
	ldr r0, _0802D65C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802D5B2
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #0
	bne _0802D5B2
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl TradeMenu_GetAdjustedRow
	adds r1, r0, #0
	cmp r1, #0
	blt _0802D652
	movs r0, #1
	strb r0, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802D660 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D5B2
	movs r0, #0x67
	bl m4aSongNumStart
_0802D5B2:
	ldr r0, _0802D65C @ =0x085775CC
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802D5FC
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802D5E2
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0802D652
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl TradeMenu_GetAdjustedRow
	adds r0, #1
	strb r0, [r4]
_0802D5E2:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r7, #1
	ldr r0, _0802D660 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D5FC
	movs r0, #0x66
	bl m4aSongNumStart
_0802D5FC:
	ldr r0, _0802D65C @ =0x085775CC
	ldr r4, [r0]
	ldrh r6, [r4, #6]
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _0802D652
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r3, [r2]
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r3, r0
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D638
	ldrh r4, [r4, #8]
	cmp r6, r4
	bne _0802D652
	movs r0, #0xff
	strb r0, [r2]
_0802D638:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r7, #1
	ldr r0, _0802D660 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D652
	movs r0, #0x66
	bl m4aSongNumStart
_0802D652:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802D65C: .4byte 0x085775CC
_0802D660: .4byte 0x0202BCEC

