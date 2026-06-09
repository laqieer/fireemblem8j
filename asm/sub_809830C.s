	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set Prep_CountSupportMenuItems, 0x080973A4 + 1
	.set Prep_GetSupportItemBitIndex, 0x08097374 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_80982B8, 0x080982B8 + 1
	.set sub_80994E4, 0x080994E4 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809830C, "ax", %progbits
@ sub_809830C @ JP 0x0809830C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809830C
	.thumb_func
sub_809830C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, _08098360 @ =0x081F5598
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x1c
	mov sl, r1
	lsls r0, r0, #4
	adds r6, r0, #0
	adds r6, #0x30
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r2, [r4]
	mov r8, r2
	cmp r2, #0
	beq _08098368
	ldr r0, _08098364 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08098356
	b _08098464
_08098356:
	bl sub_808B2A4
	movs r0, #0
	strb r0, [r4]
	b _08098526
	.align 2, 0
_08098360: .4byte 0x081F5598
_08098364: .4byte 0x085775CC
_08098368:
	ldr r0, _080983BC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080983C4
	ldr r0, _080983C0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098388
	movs r0, #0x6a
	bl m4aSongNumStart
_08098388:
	ldrb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl Prep_GetSupportItemBitIndex
	cmp r0, #2
	bne _080983AA
	movs r2, #0x80
	lsls r2, r2, #1
	mov r3, r8
	str r3, [sp]
	movs r0, #0x37
	adds r1, r2, #0
	movs r3, #0x20
	bl ChangeBgm
_080983AA:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _08098526
	.align 2, 0
_080983BC: .4byte 0x085775CC
_080983C0: .4byte 0x0202BCEC
_080983C4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080983F0
	movs r0, #1
	strb r0, [r4]
	ldrb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl Prep_GetSupportItemBitIndex
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	movs r0, #0x1c
	adds r1, r6, #0
	bl StartHelpBox
	b _08098526
_080983F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098464
	adds r0, r7, #0
	bl sub_80982B8
	ldr r0, _08098450 @ =0x08A980F0
	ldr r5, _08098454 @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	ldr r4, _08098458 @ =0x02023548
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	ldr r0, _0809845C @ =0x08A98130
	adds r1, r5, #0
	bl sub_8013008
	adds r4, #0xe2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	movs r0, #1
	movs r1, #6
	bl sub_80994E4
	ldr r0, _08098460 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098446
	movs r0, #0x6b
	bl m4aSongNumStart
_08098446:
	adds r0, r7, #0
	bl sub_8002DE4
	b _08098526
	.align 2, 0
_08098450: .4byte 0x08A980F0
_08098454: .4byte 0x02020188
_08098458: .4byte 0x02023548
_0809845C: .4byte 0x08A98130
_08098460: .4byte 0x0202BCEC
_08098464:
	ldr r0, _080984C0 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	adds r5, r7, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _08098496
	ldrb r0, [r5]
	cmp r0, #0
	bne _08098492
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08098496
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl Prep_CountSupportMenuItems
_08098492:
	subs r0, #1
	strb r0, [r5]
_08098496:
	ldr r6, _080984C0 @ =0x085775CC
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r4, #0x80
	mov r8, r4
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _080984D4
	ldrb r4, [r5]
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl Prep_CountSupportMenuItems
	subs r0, #1
	cmp r4, r0
	bge _080984C4
	ldrb r0, [r5]
	adds r0, #1
	b _080984D2
	.align 2, 0
_080984C0: .4byte 0x085775CC
_080984C4:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _080984D4
	movs r0, #0
_080984D2:
	strb r0, [r5]
_080984D4:
	ldrb r2, [r5]
	cmp sb, r2
	beq _08098526
	lsls r0, r2, #4
	adds r6, r0, #0
	adds r6, #0x30
	adds r0, r7, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq _08098506
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r2, #0
	bl Prep_GetSupportItemBitIndex
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	mov r0, sl
	adds r1, r6, #0
	bl StartHelpBox
_08098506:
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, sl
	adds r1, r6, #0
	movs r2, #7
	bl sub_80B1FBC
	ldr r0, _08098538 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098526
	movs r0, #0x66
	bl m4aSongNumStart
_08098526:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098538: .4byte 0x0202BCEC

