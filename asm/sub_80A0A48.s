	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80A0A48, "ax", %progbits
@ sub_80A0A48 @ JP 0x080A0A48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0A48
	.thumb_func
sub_80A0A48:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080A0A78 @ =0x085775CC
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A0A8E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _080A0A7C
	subs r0, #1
	strb r0, [r2]
	b _080A0ABE
	.align 2, 0
_080A0A78: .4byte 0x085775CC
_080A0A7C:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A0AD8
	subs r0, r3, #1
	strb r0, [r2]
	b _080A0ABE
_080A0A8E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A0AD8
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080A0AB0
	adds r0, r1, #1
	strb r0, [r2]
	b _080A0ABE
_080A0AB0:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A0AD8
	strb r5, [r2]
_080A0ABE:
	ldr r0, _080A0AD4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0AD0
	movs r0, #0x66
	bl m4aSongNumStart
_080A0AD0:
	movs r0, #1
	b _080A0ADA
	.align 2, 0
_080A0AD4: .4byte 0x0202BCEC
_080A0AD8:
	movs r0, #0
_080A0ADA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

