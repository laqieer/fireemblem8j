	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ClearFlag, 0x080860BC + 1
	.set GetGuideAction, 0x080D3C44 + 1
	.set LockMenuScrollBar, 0x08099930 + 1
	.set MoveGuideDetailText, 0x080D32EC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetFlag, 0x080860A8 + 1
	.set SetGuidePanelTilemapPalette, 0x080D3964 + 1
	.set UnlockMenuScrollBar, 0x0809994C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D344C, 0x080D344C + 1
	.set sub_80D3554, 0x080D3554 + 1
	.section .text.sub_80D3CD0, "ax", %progbits
@ sub_80D3CD0 @ JP 0x080D3CD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D3CD0
	.thumb_func
sub_80D3CD0:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	bl GetGuideAction
	subs r0, #1
	cmp r0, #5
	bls _080D3CE2
	b _080D4132
_080D3CE2:
	lsls r0, r0, #2
	ldr r1, _080D3CEC @ =_080D3CF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D3CEC: .4byte _080D3CF0
_080D3CF0: @ jump table
	.4byte _080D3EA8 @ case 0
	.4byte _080D3D08 @ case 1
	.4byte _080D3DD0 @ case 2
	.4byte _080D3E38 @ case 3
	.4byte _080D3D90 @ case 4
	.4byte _080D3DB0 @ case 5
_080D3D08:
	ldr r0, _080D3D38 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080D3D1A
	movs r0, #0x6a
	bl m4aSongNumStart
_080D3D1A:
	ldr r4, _080D3D3C @ =0x08BABAF4
	ldr r1, [r4]
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	beq _080D3D40
	cmp r0, #2
	beq _080D3D46
	b _080D4132
	.align 2, 0
_080D3D38: .4byte 0x0202BCEC
_080D3D3C: .4byte 0x08BABAF4
_080D3D40:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080D3E10
_080D3D46:
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080D3D8C @ =0x08BB2E60
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	bl SetFlag
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl MoveGuideDetailText
	bl LockMenuScrollBar
	b _080D4132
	.align 2, 0
_080D3D8C: .4byte 0x08BB2E60
_080D3D90:
	ldr r0, _080D3DAC @ =0x08BABAF4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #1
	bl MoveGuideDetailText
	b _080D4132
	.align 2, 0
_080D3DAC: .4byte 0x08BABAF4
_080D3DB0:
	ldr r0, _080D3DCC @ =0x08BABAF4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl MoveGuideDetailText
	b _080D4132
	.align 2, 0
_080D3DCC: .4byte 0x08BABAF4
_080D3DD0:
	ldr r0, _080D3E04 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080D3DE2
	movs r0, #0x6b
	bl m4aSongNumStart
_080D3DE2:
	ldr r2, _080D3E08 @ =0x08BABAF4
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D3E30
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D3E0C
	cmp r0, #1
	beq _080D3E1C
	b _080D4132
	.align 2, 0
_080D3E04: .4byte 0x0202BCEC
_080D3E08: .4byte 0x08BABAF4
_080D3E0C:
	movs r0, #0x80
	lsls r0, r0, #5
_080D3E10:
	bl SetGuidePanelTilemapPalette
	movs r0, #4
	bl BG_EnableSyncByMask
	b _080D4132
_080D3E1C:
	ldr r0, _080D3E2C @ =0x08BABBEC
	adds r1, r5, #0
	bl Proc_StartBlocking
	bl UnlockMenuScrollBar
	b _080D4132
	.align 2, 0
_080D3E2C: .4byte 0x08BABBEC
_080D3E30:
	adds r0, r5, #0
	bl sub_8002DE4
	b _080D4132
_080D3E38:
	ldr r0, _080D3E6C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080D3E4A
	movs r0, #0x6a
	bl m4aSongNumStart
_080D3E4A:
	ldr r3, _080D3E70 @ =0x08BABAF4
	ldr r2, [r3]
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D3E74
	movs r0, #0xb3
	bl SetFlag
	b _080D3E7A
	.align 2, 0
_080D3E6C: .4byte 0x0202BCEC
_080D3E70: .4byte 0x08BABAF4
_080D3E74:
	movs r0, #0xb3
	bl ClearFlag
_080D3E7A:
	ldr r2, _080D3EA0 @ =0x08BABAF4
	ldr r0, [r2]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2a
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2c
	strb r1, [r0]
	ldr r0, _080D3EA4 @ =0x08BABB8C
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _080D4132
	.align 2, 0
_080D3EA0: .4byte 0x08BABAF4
_080D3EA4: .4byte 0x08BABB8C
_080D3EA8:
	ldr r6, _080D3EC4 @ =0x08BABAF4
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r7, r6, #0
	cmp r0, #1
	bne _080D3EBA
	b _080D3FE4
_080D3EBA:
	cmp r0, #1
	bgt _080D3EC8
	cmp r0, #0
	beq _080D3ED0
	b _080D411C
	.align 2, 0
_080D3EC4: .4byte 0x08BABAF4
_080D3EC8:
	cmp r0, #2
	bne _080D3ECE
	b _080D409E
_080D3ECE:
	b _080D411C
_080D3ED0:
	ldr r0, _080D3F2C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080D3F30
	adds r1, r3, #0
	adds r1, #0x29
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080D3FBC
	subs r0, r2, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r1, #0
	adds r2, #0x2a
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080D3FBA
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080D3FBA
	subs r0, r1, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r1, #1
	adds r0, r5, #0
	bl sub_80D344C
	b _080D3FBA
	.align 2, 0
_080D3F2C: .4byte 0x085775CC
_080D3F30:
	adds r0, r3, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D3F4E
	adds r0, r3, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	blt _080D3F5A
	b _080D3FBC
_080D3F4E:
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080D3FBC
_080D3F5A:
	ldr r0, [r7]
	adds r0, #0x29
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x29
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	cmp r0, #4
	ble _080D3FBA
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D3F94
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _080D3FA0
	b _080D3FBA
_080D3F94:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080D3FBA
_080D3FA0:
	ldr r1, [r7]
	adds r1, #0x2a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #1
	adds r0, r5, #0
	bl sub_80D3554
_080D3FBA:
	movs r4, #1
_080D3FBC:
	cmp r4, #1
	beq _080D3FC2
	b _080D4132
_080D3FC2:
	ldr r0, _080D3FDC @ =0x08BABBEC
	adds r1, r5, #0
	bl sub_8002BCC
	ldr r2, _080D3FE0 @ =0x08BABAF4
	ldr r0, [r2]
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2c
	strb r1, [r0]
	b _080D411C
	.align 2, 0
_080D3FDC: .4byte 0x08BABBEC
_080D3FE0: .4byte 0x08BABAF4
_080D3FE4:
	ldr r0, _080D4044 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080D4048
	adds r1, r3, #0
	adds r1, #0x2b
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080D4002
	b _080D411C
_080D4002:
	subs r0, r2, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	cmp r0, #0
	ble _080D4022
	b _080D411A
_080D4022:
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080D402E
	b _080D411A
_080D402E:
	subs r0, r1, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x2b
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r1, #1
	adds r0, r5, #0
	bl sub_80D344C
	b _080D411A
	.align 2, 0
_080D4044: .4byte 0x085775CC
_080D4048:
	adds r2, r3, #0
	adds r2, #0x2b
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080D411C
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x2b
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, r3, r0
	cmp r0, #4
	ble _080D411A
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080D411A
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x2b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #1
	adds r0, r5, #0
	bl sub_80D3554
	b _080D411A
_080D409E:
	ldr r0, _080D40DC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080D40E4
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080D411C
	subs r0, r2, #1
	movs r4, #0
	strb r0, [r1]
	ldr r0, _080D40E0 @ =0x08BABC8C
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	ldr r0, [r6]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r5, #0x34]
	str r4, [r5, #0x38]
	b _080D411A
	.align 2, 0
_080D40DC: .4byte 0x085775CC
_080D40E0: .4byte 0x08BABC8C
_080D40E4:
	adds r2, r3, #0
	adds r2, #0x2e
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r3, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	subs r0, #4
	cmp r1, r0
	bge _080D411C
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r0, _080D4138 @ =0x08BABC8C
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	ldr r0, [r6]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #3
	str r0, [r5, #0x34]
	movs r0, #1
	str r0, [r5, #0x38]
_080D411A:
	movs r4, #1
_080D411C:
	cmp r4, #1
	bne _080D4132
	ldr r0, _080D413C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080D4132
	movs r0, #0x66
	bl m4aSongNumStart
_080D4132:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4138: .4byte 0x08BABC8C
_080D413C: .4byte 0x0202BCEC

