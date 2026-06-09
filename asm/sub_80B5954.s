	.syntax unified
	.set AddPartyGoldAmount, 0x08024DD0 + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80A976C, 0x080A976C + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B3804, 0x080B3804 + 1
	.set sub_80B54AC, 0x080B54AC + 1
	.set sub_80B5640, 0x080B5640 + 1
	.section .text.sub_80B5954, "ax", %progbits
@ sub_80B5954 @ JP 0x080B5954 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5954
	.thumb_func
sub_80B5954:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r4, [r6]
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B5974
	b _080B5B52
_080B5974:
	ldr r0, _080B59B0 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080B5A64
	ldr r0, _080B59B4 @ =0x08A9E500
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	bl sub_80A976C
	adds r1, r7, #0
	lsls r1, r4
	ands r1, r0
	cmp r1, #0
	beq _080B59BC
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080B59B8 @ =0x0000082C
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80B3804
	b _080B5B9E
	.align 2, 0
_080B59B0: .4byte 0x085775CC
_080B59B4: .4byte 0x08A9E500
_080B59B8: .4byte 0x0000082C
_080B59BC:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B5A48
	ldr r7, _080B59E4 @ =0x08A9E4F8
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, r1, r4
	ldrb r0, [r1, #1]
	cmp r0, #0
	bge _080B59DA
	b _080B5B9E
_080B59DA:
	cmp r0, #1
	ble _080B59E8
	cmp r0, #2
	beq _080B5A0C
	b _080B5B9E
	.align 2, 0
_080B59E4: .4byte 0x08A9E4F8
_080B59E8:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080B5A08 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B59FE
	b _080B5B9E
_080B59FE:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080B5B9E
	.align 2, 0
_080B5A08: .4byte 0x0202BCEC
_080B5A0C:
	ldrb r0, [r1, #2]
	cmp r0, #0x9f
	bne _080B5A18
	ldr r0, _080B5A40 @ =0x00000BB8
	bl AddPartyGoldAmount
_080B5A18:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	cmp r0, #0xa0
	bne _080B5A28
	ldr r0, _080B5A44 @ =0x00001388
	bl AddPartyGoldAmount
_080B5A28:
	ldrb r0, [r6]
	bl sub_80B5640
	ldrb r0, [r6]
	bl sub_80B54AC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080B5B9E
	.align 2, 0
_080B5A40: .4byte 0x00000BB8
_080B5A44: .4byte 0x00001388
_080B5A48:
	ldr r0, _080B5A60 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B5A56
	b _080B5B9E
_080B5A56:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080B5B9E
	.align 2, 0
_080B5A60: .4byte 0x0202BCEC
_080B5A64:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B5A8C
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r0, _080B5A88 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B5A80
	b _080B5B9E
_080B5A80:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B5B9E
	.align 2, 0
_080B5A88: .4byte 0x0202BCEC
_080B5A8C:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B5A98
	subs r4, #1
_080B5A98:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B5AA2
	adds r4, #1
_080B5AA2:
	ldrb r0, [r6]
	cmp r0, r4
	beq _080B5B44
	cmp r4, #0
	blt _080B5B9E
	ldr r0, _080B5AEC @ =0x08A9E504
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r4, r0
	bge _080B5B9E
	ldr r0, _080B5AF0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B5AC8
	movs r0, #0x66
	bl m4aSongNumStart
_080B5AC8:
	strb r4, [r6]
	ldrb r2, [r6]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _080B5AF4
	cmp r2, #0
	beq _080B5AF4
	movs r0, #0xff
	mov r4, r8
	strb r0, [r4]
	ldrb r0, [r6]
	subs r0, #1
	bl sub_80B54AC
	b _080B5B44
	.align 2, 0
_080B5AEC: .4byte 0x08A9E504
_080B5AF0: .4byte 0x0202BCEC
_080B5AF4:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r0]
	lsls r1, r3, #4
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0x40
	bne _080B5B2C
	ldr r0, _080B5B28 @ =0x08A9E504
	ldr r0, [r0]
	ldr r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080B5B2C
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	bl sub_80B54AC
	b _080B5B44
	.align 2, 0
_080B5B28: .4byte 0x08A9E504
_080B5B2C:
	ldrb r1, [r2]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl sub_80B1FBC
_080B5B44:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B5B9E
_080B5B52:
	adds r2, r5, #0
	adds r2, #0x2e
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080B5B64
	ldrh r0, [r5, #0x2c]
	subs r0, #4
	strh r0, [r5, #0x2c]
_080B5B64:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080B5B72
	ldrh r0, [r5, #0x2c]
	adds r0, #4
	strh r0, [r5, #0x2c]
_080B5B72:
	ldrh r1, [r5, #0x2c]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080B5B7E
	strb r1, [r2]
_080B5B7E:
	ldr r1, _080B5BA8 @ =0x0000FFD8
	ldrh r2, [r5, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r1, [r5, #0x2c]
	ldr r0, _080B5BAC @ =0x08A9E504
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #8
	movs r3, #5
	bl UpdateMenuScrollBarConfig
_080B5B9E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5BA8: .4byte 0x0000FFD8
_080B5BAC: .4byte 0x08A9E504

