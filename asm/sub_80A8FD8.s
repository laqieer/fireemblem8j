	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set IsSramWorking, 0x080A76F4 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A793C, 0x080A793C + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80A9478, 0x080A9478 + 1
	.set sub_80AADC8, 0x080AADC8 + 1
	.section .text.sub_80A8FD8, "ax", %progbits
@ PidStatsRecordLoseData @ JP 0x080A8FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PidStatsRecordLoseData
	.thumb_func
PidStatsRecordLoseData:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A90A6
	cmp r4, #0x45
	bhi _080A90A6
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A90A6
	mov r0, r8
	lsls r6, r0, #4
	ldr r0, _080A90B4 @ =0x0203E880
	adds r5, r6, r0
	cmp r5, #0
	beq _080A90A6
	ldr r1, _080A90B8 @ =0x0202BCAC
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A90A6
	ldr r7, _080A90BC @ =0x0202BCEC
	ldrb r2, [r7, #0x14]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _080A90A6
	ldrb r1, [r1, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A90A6
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080A90A6
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _080A90A6
	ldrb r0, [r5]
	cmp r0, #0xc7
	bhi _080A90A6
	adds r0, #1
	strb r0, [r5]
	movs r1, #0x80
	rsbs r1, r1, #0
	mov r0, r8
	bl sub_80A9478
	bl sub_80AADC8
	adds r4, r0, #0
	adds r4, #3
	adds r0, r4, #0
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r2, _080A90C0 @ =0x000019E4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #1
	bl WriteAndVerifySramFast
	mov r0, sp
	adds r1, r4, #0
	bl sub_80A793C
	mov r0, sp
	adds r1, r4, #0
	bl sub_80A79D8
	ldrb r0, [r7, #0xc]
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r2, _080A90C4 @ =0x0000083C
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #3
	bl WriteAndVerifySramFast
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl sub_80A793C
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl sub_80A79D8
_080A90A6:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A90B4: .4byte 0x0203E880
_080A90B8: .4byte 0x0202BCAC
_080A90BC: .4byte 0x0202BCEC
_080A90C0: .4byte 0x000019E4
_080A90C4: .4byte 0x0000083C

