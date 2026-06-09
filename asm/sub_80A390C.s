	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EndFaceById, 0x08005660 + 1
	.set GetOverallRank, 0x080BABF4 + 1
	.set GetSavedRankData, 0x080A8428 + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set strcpy, 0x080D69BC + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8031438, 0x08031438 + 1
	.set sub_80913FC, 0x080913FC + 1
	.set sub_8091544, 0x08091544 + 1
	.set sub_80A33E0, 0x080A33E0 + 1
	.set sub_80A3528, 0x080A3528 + 1
	.set sub_80A40A0, 0x080A40A0 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A390C, "ax", %progbits
@ sub_80A390C @ JP 0x080A390C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A390C
	.thumb_func
sub_80A390C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r0, sp, #0x28
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A3A28 @ =0x0100000C
	add r1, sp, #0x10
	bl sub_80D6370
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	add r0, sp, #0x10
	bl GetSavedRankData
	add r0, sp, #0x10
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	cmp r0, #0
	bne _080A394A
	b _080A3A98
_080A394A:
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	adds r3, r6, #0
	adds r3, #0x34
	strb r0, [r3]
	add r0, sp, #0x10
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	movs r1, #0x35
	adds r1, r1, r6
	mov r8, r1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	movs r2, #0x36
	adds r2, r2, r6
	mov ip, r2
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	adds r7, r6, #0
	adds r7, #0x37
	strb r1, [r7]
	add r0, sp, #0x10
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r6, #0
	adds r4, #0x38
	strb r0, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	movs r0, #0x3e
	adds r0, r0, r6
	mov sb, r0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	lsrs r0, r0, #7
	adds r1, r6, #0
	adds r1, #0x40
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r2, [r0, #7]
	lsrs r2, r2, #5
	ldr r0, [sp, #0x18]
	ldr r1, _080A3A2C @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r6, #0x58]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x17]
	adds r5, r6, #0
	adds r5, #0x3f
	strb r0, [r5]
	ldrb r0, [r3]
	mov r2, r8
	ldrb r1, [r2]
	mov r3, ip
	ldrb r2, [r3]
	ldrb r3, [r7]
	ldrb r4, [r4]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r6, #0
	adds r1, #0x39
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	adds r2, r6, #0
	adds r2, #0x4e
	strb r0, [r2]
	add r0, sp, #0x10
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	subs r2, #0x14
	strb r0, [r2]
	mov r2, sb
	ldrb r0, [r2]
	adds r7, r1, #0
	cmp r0, #0
	beq _080A3A30
	adds r4, r6, #0
	adds r4, #0x43
	add r1, sp, #0x1c
	adds r0, r4, #0
	bl strcpy
	adds r0, r4, #0
	bl sub_8031438
	b _080A3A3A
	.align 2, 0
_080A3A28: .4byte 0x0100000C
_080A3A2C: .4byte 0x001FFFFF
_080A3A30:
	ldr r0, _080A3A74 @ =0x000001F1
	bl sub_8009FA8
	bl sub_8031438
_080A3A3A:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080A3A5C
	ldrb r1, [r7]
	bl sub_80A40A0
	cmp r0, #0
	bne _080A3A4C
	strb r0, [r5]
_080A3A4C:
	ldrb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r3, _080A3A78 @ =0x08A9A8D4
	mov r8, r3
	ldr r7, _080A3A7C @ =0x02020188
	cmp r0, #0
	bne _080A3AB6
_080A3A5C:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A3A80
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r0, _080A3A78 @ =0x08A9A8D4
	mov r8, r0
	ldr r7, _080A3A7C @ =0x02020188
	b _080A3AB6
	.align 2, 0
_080A3A74: .4byte 0x000001F1
_080A3A78: .4byte 0x08A9A8D4
_080A3A7C: .4byte 0x02020188
_080A3A80:
	movs r0, #0
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r1, _080A3A90 @ =0x08A9A8D4
	mov r8, r1
	ldr r7, _080A3A94 @ =0x02020188
	b _080A3AB6
	.align 2, 0
_080A3A90: .4byte 0x08A9A8D4
_080A3A94: .4byte 0x02020188
_080A3A98:
	movs r2, #0
	adds r4, r1, #0
	ldr r3, _080A3B58 @ =0x08A9A8D4
	mov r8, r3
	ldr r7, _080A3B5C @ =0x02020188
	adds r3, r6, #0
	adds r3, #0x34
	movs r5, #0xff
_080A3AA8:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _080A3AA8
_080A3AB6:
	mov r0, r8
	adds r1, r7, #0
	bl sub_8013008
	ldr r0, _080A3B60 @ =0x020234A8
	movs r2, #0xa5
	lsls r2, r2, #7
	adds r1, r7, #0
	bl j_TmApplyTsa
	adds r0, r6, #0
	bl sub_80A3528
	adds r0, r6, #0
	bl sub_80A33E0
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r0, #0
	bl EndFaceById
	bl sub_8091544
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A3B4A
	adds r4, r6, #0
	adds r4, #0x3f
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A3B4A
	ldr r2, _080A3B64 @ =0x088582BC
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r0, #0xc1
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0xd8
	movs r3, #0x58
	bl sub_80063F8
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r1, [r1]
	bl sub_80A40A0
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl sub_8006710
	str r4, [sp]
	ldr r0, _080A3B68 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_80913FC
	ldr r0, _080A3B6C @ =0x000809FE
	bl SetCgTextFlags
_080A3B4A:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3B58: .4byte 0x08A9A8D4
_080A3B5C: .4byte 0x02020188
_080A3B60: .4byte 0x020234A8
_080A3B64: .4byte 0x088582BC
_080A3B68: .4byte 0x06011000
_080A3B6C: .4byte 0x000809FE

