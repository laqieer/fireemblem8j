	.syntax unified
	.set StartOrphanMenuAdjusted, 0x0804F924 + 1
	.section .text.StartSemiCenteredOrphanMenu, "ax", %progbits
@ StartSemiCenteredOrphanMenu @ JP 0x080503C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartSemiCenteredOrphanMenu
	.thumb_func
StartSemiCenteredOrphanMenu:
	push {r4, r5, r6, r7, lr}
	bl StartOrphanMenuAdjusted
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x60
	ldrb r0, [r2]
	cmp r0, #6
	bls _0805040A
	adds r3, r5, #0
	adds r3, #0x2d
	ldr r6, _08050414 @ =0x085E0730
	ldrb r0, [r2]
	adds r0, r0, r6
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r3]
	movs r4, #0
	ldrb r0, [r2]
	cmp r4, r0
	bge _0805040A
	adds r7, r6, #0
	adds r3, r2, #0
	adds r6, r5, #0
	adds r6, #0x34
_080503F4:
	ldm r6!, {r2}
	ldrb r0, [r3]
	adds r0, r0, r7
	ldrb r1, [r0]
	ldrh r0, [r2, #0x2c]
	subs r0, r0, r1
	strh r0, [r2, #0x2c]
	adds r4, #1
	ldrb r0, [r3]
	cmp r4, r0
	blt _080503F4
_0805040A:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08050414: .4byte 0x085E0730

