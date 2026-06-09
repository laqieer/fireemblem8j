	.syntax unified
	.set GetSupportScreenPartnerSupportLevel, 0x080A48BC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80A5F20, 0x080A5F20 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A6214, "ax", %progbits
@ sub_80A6214 @ JP 0x080A6214 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6214
	.thumb_func
sub_80A6214:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _080A6248 @ =0x085775CC
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A6250
	ldr r0, _080A624C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A623C
	movs r0, #0x6b
	bl m4aSongNumStart
_080A623C:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _080A63B6
	.align 2, 0
_080A6248: .4byte 0x085775CC
_080A624C: .4byte 0x0202BCEC
_080A6250:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A6266
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _080A63B6
_080A6266:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A627A
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _080A63B6
_080A627A:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A628A
	b _080A63B6
_080A628A:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A6296
	b _080A639C
_080A6296:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _080A62C8
	ldr r0, _080A62C4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A62B8
	movs r0, #0x6a
	bl m4aSongNumStart
_080A62B8:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _080A63B6
	.align 2, 0
_080A62C4: .4byte 0x0202BCEC
_080A62C8:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A62E2
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _080A62E2
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_080A62E2:
	ldr r0, _080A6394 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A631C
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl GetSupportScreenPartnerSupportLevel
	subs r0, #1
	cmp r4, r0
	bge _080A631C
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_080A631C:
	ldr r4, _080A6394 @ =0x085775CC
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A633E
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r6, #0
	bl sub_80A5F20
_080A633E:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A635C
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_80A5F20
_080A635C:
	ldrb r1, [r5]
	cmp r7, r1
	beq _080A63B6
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80B1FBC
	ldr r0, _080A6398 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A63B6
	movs r0, #0x65
	bl m4aSongNumStart
	b _080A63B6
	.align 2, 0
_080A6394: .4byte 0x085775CC
_080A6398: .4byte 0x0202BCEC
_080A639C:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080A63B6
	ldr r0, _080A63C0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A63B6
	movs r0, #0x6c
	bl m4aSongNumStart
_080A63B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A63C0: .4byte 0x0202BCEC

