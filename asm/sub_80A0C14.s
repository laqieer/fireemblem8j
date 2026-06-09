	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set StartPrepErrorHelpbox, 0x0809A080 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_809A270, 0x0809A270 + 1
	.set sub_80A0A48, 0x080A0A48 + 1
	.set sub_80A0AFC, 0x080A0AFC + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A0C14, "ax", %progbits
@ sub_80A0C14 @ JP 0x080A0C14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0C14
	.thumb_func
sub_80A0C14:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _080A0C3C
	ldr r0, _080A0C38 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0CD4
	bl sub_808B2A4
	movs r0, #0
	strh r0, [r4, #0x38]
	b _080A0D16
	.align 2, 0
_080A0C38: .4byte 0x085775CC
_080A0C3C:
	ldr r0, _080A0C70 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0C74
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A0D16
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _080A0D16
	.align 2, 0
_080A0C70: .4byte 0x085775CC
_080A0C74:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0CAC
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_809A270
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A0CA4
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080A0CA0 @ =0x000006FC
	adds r0, r1, #0
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _080A0D16
	.align 2, 0
_080A0CA0: .4byte 0x000006FC
_080A0CA4:
	adds r0, r4, #0
	bl sub_80A0AFC
	b _080A0D16
_080A0CAC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A0CD4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A0CD0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0D16
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A0D16
	.align 2, 0
_080A0CD0: .4byte 0x0202BCEC
_080A0CD4:
	adds r0, r4, #0
	bl sub_80A0A48
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0D16
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _080A0D16
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A0D16
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_080A0D16:
	pop {r4, r5}
	pop {r0}
	bx r0

