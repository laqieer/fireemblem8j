	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set StartPrepErrorHelpbox, 0x0809A080 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_80A224C, 0x080A224C + 1
	.set sub_80A25C8, 0x080A25C8 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B9DEC, 0x080B9DEC + 1
	.section .text.sub_80A26C0, "ax", %progbits
@ WmSell_OnLoop_MainKeyHandler @ JP 0x080A26C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WmSell_OnLoop_MainKeyHandler
	.thumb_func
WmSell_OnLoop_MainKeyHandler:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A26E8
	ldr r0, _080A26E4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A27B4
	bl sub_808B2A4
	movs r0, #0
	strh r0, [r4, #0x34]
	b _080A2806
	.align 2, 0
_080A26E4: .4byte 0x085775CC
_080A26E8:
	ldr r0, _080A2720 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A2724
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _080A270E
	b _080A2806
_080A270E:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b _080A2806
	.align 2, 0
_080A2720: .4byte 0x085775CC
_080A2724:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A278C
	ldr r1, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl sub_80B9DEC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080A2756
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A276C
_080A2756:
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x48
	ldr r2, _080A2768 @ =0x000007CE
	movs r0, #0x10
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _080A2806
	.align 2, 0
_080A2768: .4byte 0x000007CE
_080A276C:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A2788 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2806
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A2806
	.align 2, 0
_080A2788: .4byte 0x0202BCEC
_080A278C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A27B4
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A27B0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2806
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A2806
	.align 2, 0
_080A27B0: .4byte 0x0202BCEC
_080A27B4:
	adds r0, r4, #0
	bl sub_80A25C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2806
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80A224C
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A2806
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A2806
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_080A2806:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

