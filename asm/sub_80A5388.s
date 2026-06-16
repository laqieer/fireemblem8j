	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_80A487C, 0x080A487C + 1
	.set sub_80A5774, 0x080A5774 + 1
	.set sub_80B1F84, 0x080B1F84 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A5388, "ax", %progbits
@ SupportScreen_Loop_KeyHandler @ JP 0x080A5388 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SupportScreen_Loop_KeyHandler
	.thumb_func
SupportScreen_Loop_KeyHandler:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_80A487C
	cmp r0, #0
	bne _080A539E
	b _080A56B0
_080A539E:
	adds r0, r6, #0
	adds r0, #0x40
	movs r7, #0
	ldrsb r7, [r0, r7]
	mov r8, r0
	cmp r7, #0
	beq _080A53AE
	b _080A563C
_080A53AE:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r4, _080A53F8 @ =0x085775CC
	ldr r2, [r4]
	ldrh r5, [r2, #6]
	adds r3, r6, #0
	adds r3, #0x41
	movs r0, #4
	strb r0, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A53D2
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_080A53D2:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r1, #0
	beq _080A53FC
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A54B4
	bl sub_808B2A4
	mov r1, sb
	strb r7, [r1]
	b _080A56D8
	.align 2, 0
_080A53F8: .4byte 0x085775CC
_080A53FC:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A545C
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A542C
	adds r0, #0xf
_080A542C:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x24
	ldr r5, _080A5458 @ =0x088582BC
	adds r0, r7, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _080A56D8
	.align 2, 0
_080A5458: .4byte 0x088582BC
_080A545C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A5488
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A5484 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A547A
	b _080A56D8
_080A547A:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A56D8
	.align 2, 0
_080A5484: .4byte 0x0202BCEC
_080A5488:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A54B4
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A54B0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A54A6
	b _080A56D8
_080A54A6:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A56D8
	.align 2, 0
_080A54B0: .4byte 0x0202BCEC
_080A54B4:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _080A54CE
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _080A54CE
	subs r0, r4, #1
	str r0, [r6, #0x38]
_080A54CE:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _080A54FA
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _080A54FA
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl sub_80A487C
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _080A54FA
	bl sub_80A487C
	subs r0, #1
	str r0, [r6, #0x38]
_080A54FA:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _080A550C
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _080A550C
	subs r0, #3
	str r0, [r6, #0x38]
_080A550C:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _080A5526
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl sub_80A487C
	cmp r4, r0
	bge _080A5526
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_080A5526:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _080A552E
	b _080A5632
_080A552E:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A553E
	adds r0, #0xf
_080A553E:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080A557C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A555C
	movs r0, #0x65
	bl m4aSongNumStart
_080A555C:
	cmp r4, #0xf
	bgt _080A5580
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _080A5580
	cmp r1, #0
	bge _080A556C
	adds r1, #0xf
_080A556C:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_80A5774
	movs r0, #0xff
	b _080A55AC
	.align 2, 0
_080A557C: .4byte 0x0202BCEC
_080A5580:
	cmp r4, #0x4f
	ble _080A55C2
	bl sub_80A487C
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _080A55C2
	cmp r1, #0
	bge _080A55A0
	adds r1, #0xf
_080A55A0:
	asrs r1, r1, #4
	adds r1, #6
	adds r0, r6, #0
	bl sub_80A5774
	movs r0, #1
_080A55AC:
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	bl sub_80B1F84
	b _080A55DC
_080A55C2:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80B1FBC
_080A55DC:
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A5632
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov sb, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _080A5606
	adds r4, #0xf
_080A5606:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x24
	subs r4, r4, r0
	ldr r5, _080A56A8 @ =0x088582BC
	adds r0, r7, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, sb
	adds r1, r4, #0
	bl StartHelpBox
_080A5632:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A56D8
_080A563C:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080A5652
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_080A5652:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080A5666
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	adds r0, r0, r1
	str r0, [r6, #0x34]
_080A5666:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080A5674
	mov r0, r8
	strb r1, [r0]
_080A5674:
	ldrh r4, [r6, #0x34]
	bl sub_80A487C
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	ldr r1, _080A56AC @ =0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	b _080A56D8
	.align 2, 0
_080A56A8: .4byte 0x088582BC
_080A56AC: .4byte 0x0000FFD8
_080A56B0:
	ldr r0, _080A56E8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A56D8
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A56EC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A56D8
	movs r0, #0x6b
	bl m4aSongNumStart
_080A56D8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A56E8: .4byte 0x085775CC
_080A56EC: .4byte 0x0202BCEC

