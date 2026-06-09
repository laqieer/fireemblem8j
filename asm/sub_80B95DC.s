	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set DisplayShopUiArrows, 0x080B9F08 + 1
	.set IsShopPageScrolling, 0x080BA250 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ShopSt_GetBg2Offset, 0x080BA21C + 1
	.set ShopSt_GetHandLoc, 0x080BA22C + 1
	.set ShopSt_GetHeadLoc, 0x080BA210 + 1
	.set Shop_TryMoveHandPage, 0x080BA188 + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_80B95DC, "ax", %progbits
@ sub_80B95DC @ JP 0x080B95DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B95DC
	.thumb_func
sub_80B95DC:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl Shop_TryMoveHandPage
	bl ShopSt_GetBg2Offset
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r5, #0
	adds r6, #0x5c
	ldrb r4, [r6]
	bl ShopSt_GetHeadLoc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r0, r4
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	bl ShopSt_GetHeadLoc
	strb r0, [r6]
	bl ShopSt_GetHandLoc
	adds r4, r5, #0
	adds r4, #0x5d
	strb r0, [r4]
	ldrb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x5e
	strb r0, [r1]
	ldrb r0, [r4]
	adds r1, #1
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	movs r0, #0x38
	bl sub_804F528
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B9666
	cmp r7, #0
	beq _080B9666
	ldrb r2, [r6]
	lsls r1, r2, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
_080B9666:
	bl DisplayShopUiArrows
	bl IsShopPageScrolling
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080B96FA
	adds r2, r5, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B969C
	ldr r0, _080B9698 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B96FA
	strb r3, [r2]
	bl sub_808B2A4
	b _080B96FA
	.align 2, 0
_080B9698: .4byte 0x085775CC
_080B969C:
	ldr r0, _080B96D4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B96D8
	movs r0, #1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	lsls r1, r2, #4
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
	b _080B96FA
	.align 2, 0
_080B96D4: .4byte 0x085775CC
_080B96D8:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080B96FA
	ldr r0, _080B9700 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B96F2
	movs r0, #0x6b
	bl m4aSongNumStart
_080B96F2:
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
_080B96FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9700: .4byte 0x0202BCEC

