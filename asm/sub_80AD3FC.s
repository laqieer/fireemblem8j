	.syntax unified
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_80AD368, 0x080AD368 + 1
	.section .text.sub_80AD3FC, "ax", %progbits
@ sub_80AD3FC @ JP 0x080AD3FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD3FC
	.thumb_func
sub_80AD3FC:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #8
	adds r5, r6, #0
	adds r5, #0x40
	ldrb r0, [r5]
	cmp r0, #8
	bne _080AD42C
	ldr r0, _080AD428 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf9
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AD488
	bl sub_808B2A4
	movs r0, #7
	strb r0, [r5]
	b _080AD488
	.align 2, 0
_080AD428: .4byte 0x085775CC
_080AD42C:
	ldr r0, _080AD460 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AD488
	adds r4, r6, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	bl sub_80AD368
	cmp r0, #0
	bne _080AD468
	ldr r0, _080AD464 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD488
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080AD488
	.align 2, 0
_080AD460: .4byte 0x085775CC
_080AD464: .4byte 0x0202BCEC
_080AD468:
	cmp r0, #0
	blt _080AD488
	cmp r0, #2
	bgt _080AD488
	ldr r0, _080AD4A4 @ =0x06014000
	movs r1, #9
	bl sub_808BB14
	ldrb r1, [r4]
	lsls r1, r1, #5
	adds r1, #0x2c
	ldr r2, _080AD4A8 @ =0x0000FFFE
	movs r0, #0x50
	bl StartItemHelpBox
	strb r7, [r5]
_080AD488:
	adds r1, r6, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AD4A0
	cmp r0, r7
	bge _080AD49A
	subs r0, #1
	strb r0, [r1]
_080AD49A:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080AD4AC
_080AD4A0:
	movs r0, #0
	b _080AD4AE
	.align 2, 0
_080AD4A4: .4byte 0x06014000
_080AD4A8: .4byte 0x0000FFFE
_080AD4AC:
	movs r0, #1
_080AD4AE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

