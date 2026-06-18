	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetAiBestSafeStaffTargetPosition, 0x0803C214 + 1
	.set GetUnit, 0x08019108 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_803BF60, 0x0803BF60 + 1
	.set sub_803C3DC, 0x0803C3DC + 1
	.set sub_803C420, 0x0803C420 + 1
	.set sub_8040228, 0x08040228 + 1
	.set sub_8040280, 0x08040280 + 1
	.set sub_80D65E4, 0x080D65E4 + 1
	.section .text.sub_80402D4, "ax", %progbits
@ AiStaffSilence @ JP 0x080402D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiStaffSilence
	.thumb_func
AiStaffSilence:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sl, r1
	movs r0, #0
	str r0, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	movs r3, #0
	str r3, [sp, #0x20]
	ldr r0, _08040450 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08040304
	b _08040440
_08040304:
	ldr r0, _08040454 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
	movs r4, #1
	mov sb, r4
_08040318:
	mov r0, sb
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08040410
	ldr r0, [r6]
	cmp r0, #0
	beq _08040410
	ldr r0, [r6, #0xc]
	ldr r1, _08040458 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08040410
	ldr r0, _08040450 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08040354
	mov r0, sl
	cmp r0, #0
	beq _08040354
	adds r0, r6, #0
	bl sub_80D65E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040410
_08040354:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08040410
	adds r0, r6, #0
	bl sub_803C3DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040410
	ldr r1, _08040454 @ =0x03004DF0
	mov r8, r1
	ldr r0, [r1]
	bl sub_8018730
	mov r3, r8
	ldr r2, [r3]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r4, [r2, #0x1d]
	adds r1, r1, r4
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
	beq _08040410
	adds r0, r6, #0
	bl sub_8040228
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040410
	adds r0, r6, #0
	bl sub_8040280
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _08040410
	ldr r0, [sp, #0x14]
	cmp r7, r0
	blo _08040410
	ldr r0, _0804045C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	mov r1, r8
	ldr r0, [r1]
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
	beq _08040410
	str r7, [sp, #0x14]
	add r0, sp, #0xc
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x18]
	movs r1, #2
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x1c]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x20]
_08040410:
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #0xbf
	bgt _0804041C
	b _08040318
_0804041C:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq _08040440
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	lsls r3, r2, #0x18
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
_08040440:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040450: .4byte 0x0203AA00
_08040454: .4byte 0x03004DF0
_08040458: .4byte 0x00010005
_0804045C: .4byte 0x0202E4E0

