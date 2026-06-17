	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_809C84C, 0x0809C84C + 1
	.set sub_809C910, 0x0809C910 + 1
	.set sub_809CCC4, 0x0809CCC4 + 1
	.set sub_809CDBC, 0x0809CDBC + 1
	.set PrepUnit_HandlePressA, 0x0809CF80 + 1
	.set sub_809D058, 0x0809D058 + 1
	.set sub_809D0D8, 0x0809D0D8 + 1
	.set sub_80B18C0, 0x080B18C0 + 1
	.set sub_80B1F84, 0x080B1F84 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809D300, "ax", %progbits
@ sub_809D300 @ JP 0x0809D300 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ProcPrepUnit_Idle
	.thumb_func
ProcPrepUnit_Idle:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809D30E
	b _0809D522
_0809D30E:
	ldr r4, _0809D35C @ =0x085775CC
	ldr r2, [r4]
	ldrh r6, [r2, #6]
	adds r3, r5, #0
	adds r3, #0x36
	movs r7, #4
	strb r7, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809D32E
	ldrh r6, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_0809D32E:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0809D384
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D364
	ldr r0, _0809D360 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809D352
	b _0809D59C
_0809D352:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809D59C
	.align 2, 0
_0809D35C: .4byte 0x085775CC
_0809D360: .4byte 0x0202BCEC
_0809D364:
	ldr r0, _0809D380 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D376
	movs r0, #0x6a
	bl m4aSongNumStart
_0809D376:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809D59C
	.align 2, 0
_0809D380: .4byte 0x0202BCEC
_0809D384:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809D3AC
	ldr r0, _0809D3A8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D39E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809D39E:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809D59C
	.align 2, 0
_0809D3A8: .4byte 0x0202BCEC
_0809D3AC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809D3C0
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809D59C
_0809D3C0:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809D3E2
	adds r0, r5, #0
	bl PrepUnit_HandlePressA
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D3D8
	b _0809D59C
_0809D3D8:
	adds r0, r5, #0
	movs r1, #1
	bl sub_809CDBC
	b _0809D59C
_0809D3E2:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809D40C
	ldr r0, _0809D408 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D3FC
	movs r0, #0x6b
	bl m4aSongNumStart
_0809D3FC:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _0809D59C
	.align 2, 0
_0809D408: .4byte 0x0202BCEC
_0809D40C:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _0809D422
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809D422
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_0809D422:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _0809D446
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809D446
	ldrh r4, [r5, #0x2e]
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bge _0809D446
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0809D446:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _0809D458
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _0809D458
	strh r0, [r5, #0x2e]
_0809D458:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _0809D474
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bgt _0809D474
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_0809D474:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	bne _0809D47E
	b _0809D59C
_0809D47E:
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809CCC4
	ldr r0, _0809D4EC @ =sub_809CCB4
	movs r1, #1
	adds r2, r5, #0
	bl sub_80B18C0
	ldr r0, _0809D4F0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D4A4
	movs r0, #0x65
	bl m4aSongNumStart
_0809D4A4:
	adds r0, r5, #0
	bl sub_809D058
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D4F4
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _0809D4C4
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r5, #0
	bl sub_809C84C
_0809D4C4:
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bls _0809D4D8
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, #6
	adds r0, r5, #0
	bl sub_809C84C
_0809D4D8:
	ldrh r0, [r5, #0x2e]
	movs r1, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	bl sub_80B1F84
	b _0809D51A
	.align 2, 0
_0809D4EC: .4byte 0x0809CCB5  @ sub_809CCB4
_0809D4F0: .4byte 0x0202BCEC
_0809D4F4:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80B1FBC
_0809D51A:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809D59C
_0809D522:
	ldrh r3, [r5, #0x2e]
	ldrh r2, [r5, #0x2c]
	cmp r3, r2
	bhs _0809D536
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
_0809D536:
	cmp r3, r2
	bls _0809D546
	adds r1, r5, #0
	adds r1, #0x36
	ldrh r0, [r5, #0x30]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
_0809D546:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809D56C
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_809C910
	ldrh r0, [r5, #0x30]
	lsrs r0, r0, #4
	adds r0, #6
	bl sub_809C910
	adds r0, r5, #0
	bl sub_809D0D8
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_0809D56C:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
_0809D59C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

