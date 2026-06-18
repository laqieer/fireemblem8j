	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetAiBestSafeStaffTargetPosition, 0x0803C214 + 1
	.set GetUnit, 0x08019108 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_802CC14, 0x0802CC14 + 1
	.set sub_803BF60, 0x0803BF60 + 1
	.set sub_803C420, 0x0803C420 + 1
	.set sub_8040228, 0x08040228 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_8040460, "ax", %progbits
@ AiStaffSleepBerserk @ JP 0x08040460 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiStaffSleepBerserk
	.thumb_func
AiStaffSleepBerserk:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r3, #0
	str r3, [sp, #0x1c]
	ldr r0, _080405D4 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08040490
	b _080405C2
_08040490:
	ldr r0, _080405D8 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
	movs r4, #1
	mov r8, r4
_080404A4:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08040592
	ldr r0, [r6]
	cmp r0, #0
	beq _08040592
	ldr r0, [r6, #0xc]
	ldr r1, _080405DC @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08040592
	ldr r0, _080405D4 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080404E0
	mov r0, sb
	cmp r0, #0
	beq _080404E0
	adds r0, r6, #0
	bl sub_80D65E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040592
_080404E0:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08040592
	ldr r7, _080405D8 @ =0x03004DF0
	ldr r0, [r7]
	bl sub_8018730
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r3, [r2, #0x1d]
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_803BF60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040592
	adds r0, r6, #0
	bl sub_8040228
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040592
	ldr r0, [r7]
	adds r1, r6, #0
	bl sub_802CC14
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _08040592
	movs r0, #8
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	cmp r0, sl
	blt _08040592
	ldr r0, _080405E0 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl sub_8018730
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r4, sp, #0xc
	adds r0, r4, #0
	bl GetAiBestSafeStaffTargetPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040592
	ldrb r0, [r6, #8]
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r0, #2
	ldrsh r3, [r4, r0]
	str r3, [sp, #0x18]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x1c]
_08040592:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #0xbf
	bgt _0804059E
	b _080404A4
_0804059E:
	mov r3, sl
	cmp r3, #0
	beq _080405C2
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_080405C2:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080405D4: .4byte 0x0203AA00
_080405D8: .4byte 0x03004DF0
_080405DC: .4byte 0x00010005
_080405E0: .4byte 0x0202E4E0

