	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetGMapBaseMenuKind, 0x080C8E28 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set UnitHasItem, 0x080177A0 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_809B118, 0x0809B118 + 1
	.set sub_809B284, 0x0809B284 + 1
	.set sub_809C178, 0x0809C178 + 1
	.set sub_809C250, 0x0809C250 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.section .text.sub_809B3F8, "ax", %progbits
@ sub_809B3F8 @ JP 0x0809B3F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B3F8
	.thumb_func
sub_809B3F8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0809B40A
	b _0809B5E6
_0809B40A:
	ldr r0, _0809B424 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B428
	adds r0, r6, #0
	bl sub_8002DE4
	b _0809B5EC
	.align 2, 0
_0809B424: .4byte 0x085775CC
_0809B428:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0809B434
	b _0809B560
_0809B434:
	ldr r0, _0809B47C @ =0x03005270
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B4DA
	bl GetGMapBaseMenuKind
	cmp r0, #2
	beq _0809B480
	cmp r0, #3
	bne _0809B4D4
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0809B508
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _0809B508
	ldrb r0, [r4]
	adds r0, #1
	b _0809B50C
	.align 2, 0
_0809B47C: .4byte 0x03005270
_0809B480:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B4B8
	ldr r0, _0809B4B4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B4A8
	movs r0, #0x6a
	bl m4aSongNumStart
_0809B4A8:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	b _0809B5EC
	.align 2, 0
_0809B4B4: .4byte 0x0202BCEC
_0809B4B8:
	ldr r0, _0809B4D0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809B4C6
	b _0809B5EC
_0809B4C6:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809B5EC
	.align 2, 0
_0809B4D0: .4byte 0x0202BCEC
_0809B4D4:
	adds r0, r6, #0
	movs r1, #0xd
	b _0809B542
_0809B4DA:
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0809B508
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _0809B508
	ldrb r0, [r4]
	adds r0, #1
	b _0809B50C
_0809B508:
	ldrb r0, [r4]
	subs r0, #1
_0809B50C:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80B1474
	adds r0, r6, #0
	movs r1, #2
_0809B542:
	bl Proc_Goto
	ldr r0, _0809B55C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B5EC
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809B5EC
	.align 2, 0
_0809B55C: .4byte 0x0202BCEC
_0809B560:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B5A4
	ldr r0, _0809B59C @ =0x03005270
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B580
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_0809B580:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	ldr r0, _0809B5A0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B5EC
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809B5EC
	.align 2, 0
_0809B59C: .4byte 0x03005270
_0809B5A0: .4byte 0x0202BCEC
_0809B5A4:
	adds r0, r6, #0
	bl sub_809B118
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B5E6
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809B5F4 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_809C178
	ldr r4, _0809B5F8 @ =0x02013510
	ldr r5, _0809B5FC @ =0x02022EEC
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_809C250
	movs r0, #1
	bl BG_EnableSyncByMask
_0809B5E6:
	adds r0, r6, #0
	bl sub_809B284
_0809B5EC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B5F4: .4byte 0x00000503
_0809B5F8: .4byte 0x02013510
_0809B5FC: .4byte 0x02022EEC

