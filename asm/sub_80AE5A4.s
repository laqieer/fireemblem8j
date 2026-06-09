	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ReadLastGameSaveId, 0x080A97E4 + 1
	.set SaveMenuGetBitfile, 0x080AD25C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80AD244, 0x080AD244 + 1
	.set sub_80AE774, 0x080AE774 + 1
	.set sub_80B0444, 0x080B0444 + 1
	.section .text.sub_80AE5A4, "ax", %progbits
@ sub_80AE5A4 @ JP 0x080AE5A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE5A4
	.thumb_func
sub_80AE5A4:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r7, [r2]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080AE5E8 @ =0x085775CC
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080AE5EC
	ldrb r0, [r2]
	cmp r0, #0
	bne _080AE5E2
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080AE616
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
_080AE5E2:
	subs r0, #1
	strb r0, [r2]
	b _080AE616
	.align 2, 0
_080AE5E8: .4byte 0x085775CC
_080AE5EC:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080AE616
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080AE60A
	adds r0, r1, #1
	strb r0, [r2]
	b _080AE616
_080AE60A:
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080AE616
	strb r5, [r2]
_080AE616:
	adds r0, r4, #0
	adds r0, #0x34
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r7, r0
	beq _080AE634
	ldr r0, _080AE688 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE634
	movs r0, #0x66
	bl m4aSongNumStart
_080AE634:
	ldr r0, _080AE68C @ =0x085775CC
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _080AE644
	b _080AE740
_080AE644:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	ldrb r1, [r5]
	bl SaveMenuGetBitfile
	adds r5, r4, #0
	adds r5, #0x35
	movs r6, #0
	strb r0, [r5]
	ldr r0, _080AE688 @ =0x0202BCEC
	adds r7, r0, #0
	adds r7, #0x41
	ldrb r0, [r7]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE66C
	movs r0, #0x6a
	bl m4aSongNumStart
_080AE66C:
	adds r0, r4, #0
	adds r0, #0x29
	strb r6, [r0]
	ldrb r0, [r5]
	cmp r0, #8
	beq _080AE6D6
	cmp r0, #8
	bgt _080AE690
	cmp r0, #2
	beq _080AE6CC
	cmp r0, #4
	beq _080AE6E0
	b _080AE730
	.align 2, 0
_080AE688: .4byte 0x0202BCEC
_080AE68C: .4byte 0x085775CC
_080AE690:
	cmp r0, #0x20
	beq _080AE6A2
	cmp r0, #0x20
	bgt _080AE69E
	cmp r0, #0x10
	beq _080AE6FA
	b _080AE730
_080AE69E:
	cmp r0, #0x40
	bne _080AE730
_080AE6A2:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80B0444
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_80AE774
	ldr r0, _080AE6C8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	b _080AE71A
	.align 2, 0
_080AE6C8: .4byte 0x0202BCEC
_080AE6CC:
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	b _080AE6EA
_080AE6D6:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #0x40
	b _080AE6E8
_080AE6E0:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #9
_080AE6E8:
	movs r1, #0xc0
_080AE6EA:
	movs r3, #0x18
	bl ChangeBgm
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080AE768
_080AE6FA:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80B0444
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_80AE774
	ldrb r0, [r7]
_080AE71A:
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE726
	movs r0, #0x6a
	bl m4aSongNumStart
_080AE726:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080AE768
_080AE730:
	adds r0, r4, #0
	bl sub_80AD244
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080AE768
_080AE740:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080AE768
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r0, _080AE770 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE768
	movs r0, #0x6b
	bl m4aSongNumStart
_080AE768:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE770: .4byte 0x0202BCEC

