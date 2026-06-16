	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set AiSimulateBestBattleAgainstTarget, 0x0803DC54 + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set MarkMovementMapEdges, 0x0801A5C0 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_80379F4, 0x080379F4 + 1
	.set sub_8037B04, 0x08037B04 + 1
	.set sub_803AC5C, 0x0803AC5C + 1
	.set sub_803D810, 0x0803D810 + 1
	.set AiAttemptBallistaCombat, 0x0803D928 + 1
	.set sub_803DAF0, 0x0803DAF0 + 1
	.set sub_80D65D8, 0x080D65D8 + 1
	.section .text.sub_803D3E0, "ax", %progbits
@ sub_803D3E0 @ JP 0x0803D3E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803D3E0
	.thumb_func
sub_803D3E0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	movs r5, #0
	strb r5, [r0, #2]
	str r5, [r0, #8]
	ldr r6, _0803D44C @ =0x03004DF0
	ldr r3, [r6]
	ldr r1, [r3, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	mov sl, r0
	cmp r1, #0
	beq _0803D454
	ldr r4, _0803D450 @ =0x0202E4DC
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80379F4
	adds r1, r0, #0
	cmp r1, #0
	beq _0803D442
	b _0803D5B8
_0803D442:
	ldr r0, [r6]
	bl sub_8037B04
	b _0803D4EA
	.align 2, 0
_0803D44C: .4byte 0x03004DF0
_0803D450: .4byte 0x0202E4DC
_0803D454:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803D48A
	adds r0, r3, #0
	bl GetUnitItemCount
	cmp r0, #4
	bgt _0803D48A
	ldr r0, [r6]
	bl sub_801A05C
	bl MarkMovementMapEdges
	bl sub_803DAF0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D48A
	movs r0, #0
	b _0803D62C
_0803D48A:
	ldr r0, _0803D4C0 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D4CC
	ldr r4, _0803D4C4 @ =0x0202E4DC
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _0803D4C8 @ =0x03004DF0
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _0803D4D4
	.align 2, 0
_0803D4C0: .4byte 0x0203AA00
_0803D4C4: .4byte 0x0202E4DC
_0803D4C8: .4byte 0x03004DF0
_0803D4CC:
	ldr r0, _0803D63C @ =0x03004DF0
	ldr r0, [r0]
	bl sub_801A05C
_0803D4D4:
	ldr r0, _0803D63C @ =0x03004DF0
	ldr r0, [r0]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D4EA
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
_0803D4EA:
	ldr r0, _0803D640 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	movs r1, #0
	mov r8, r1
	ldr r2, _0803D63C @ =0x03004DF0
	ldr r1, [r2]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803D5B8
	mov sb, r2
_0803D502:
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq _0803D59E
	mov r3, sb
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D59E
	add r0, sp, #0xc
	mov r4, r8
	strh r4, [r0, #4]
	movs r6, #1
_0803D526:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803D598
	ldr r1, [r4]
	cmp r1, #0
	beq _0803D598
	ldr r1, [r4, #0xc]
	ldr r2, _0803D644 @ =0x00010025
	ands r1, r2
	cmp r1, #0
	bne _0803D598
	ldr r7, [sp, #0x24]
	bl sub_80D65D8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D598
	mov r1, sb
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_803AC5C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D598
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D810
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl AiSimulateBestBattleAgainstTarget
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D598
	ldr r2, [sp, #0x14]
	mov r3, sl
	ldr r1, [r3, #8]
	cmp r2, r1
	blo _0803D598
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, r8
	mov r4, sl
	strh r7, [r4, #4]
_0803D598:
	adds r6, #1
	cmp r6, #0xbf
	ble _0803D526
_0803D59E:
	ldr r1, [sp, #0x28]
	mov r8, r1
	cmp r1, #4
	bgt _0803D5B8
	mov r2, sb
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803D502
_0803D5B8:
	ldr r1, _0803D63C @ =0x03004DF0
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0803D5F2
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl AiAttemptBallistaCombat
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _0803D5F2
	ldr r2, [sp, #0x14]
	mov r4, sl
	ldr r1, [r4, #8]
	cmp r2, r1
	blo _0803D5F2
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
_0803D5F2:
	mov r2, sl
	ldr r1, [r2, #8]
	cmp r1, #0
	bne _0803D600
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq _0803D62C
_0803D600:
	mov r4, sl
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r2, r1
	beq _0803D62C
	ldr r0, _0803D63C @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8037B04
_0803D62C:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D63C: .4byte 0x03004DF0
_0803D640: .4byte 0x0202E4E0
_0803D644: .4byte 0x00010025

