	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80A25C8, "ax", %progbits
@ sub_80A25C8 @ JP 0x080A25C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A25C8
	.thumb_func
sub_80A25C8:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080A25F8 @ =0x085775CC
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A260E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _080A25FC
	subs r0, #1
	strb r0, [r2]
	b _080A263E
	.align 2, 0
_080A25F8: .4byte 0x085775CC
_080A25FC:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A2658
	subs r0, r3, #1
	strb r0, [r2]
	b _080A263E
_080A260E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A2658
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080A2630
	adds r0, r1, #1
	strb r0, [r2]
	b _080A263E
_080A2630:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A2658
	strb r5, [r2]
_080A263E:
	ldr r0, _080A2654 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2650
	movs r0, #0x66
	bl m4aSongNumStart
_080A2650:
	movs r0, #1
	b _080A265A
	.align 2, 0
_080A2654: .4byte 0x0202BCEC
_080A2658:
	movs r0, #0
_080A265A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

