	.syntax unified
	.set GetNodeAtPosition, 0x080C0458 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set WmMain_MoveCamera, 0x080BE0E0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80BE198, 0x080BE198 + 1
	.set sub_80BE2A8, 0x080BE2A8 + 1
	.set sub_80BE3F8, 0x080BE3F8 + 1
	.set sub_80BE44C, 0x080BE44C + 1
	.set sub_80BE4B8, 0x080BE4B8 + 1
	.section .text.sub_80BE594, "ax", %progbits
@ sub_80BE594 @ JP 0x080BE594 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE594
	.thumb_func
sub_80BE594:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080BE5C4 @ =0x03005270
	ldr r5, [r2, #8]
	ldr r6, [r2, #0xc]
	ldr r0, _080BE5C8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080BE5D2
	ldrb r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080BE5CC
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	b _080BE5D0
	.align 2, 0
_080BE5C4: .4byte 0x03005270
_080BE5C8: .4byte 0x085775CC
_080BE5CC:
	movs r0, #4
	orrs r0, r1
_080BE5D0:
	strb r0, [r2]
_080BE5D2:
	ldr r0, [r4, #0x48]
	asrs r1, r5, #8
	asrs r2, r6, #8
	movs r3, #0
	str r3, [sp]
	bl GetNodeAtPosition
	adds r1, r0, #0
	cmp r1, #0
	blt _080BE634
	ldr r0, _080BE614 @ =0x085775CC
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080BE61C
	adds r0, r4, #0
	bl sub_80BE198
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BE658
	ldr r0, _080BE618 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BE686
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080BE686
	.align 2, 0
_080BE614: .4byte 0x085775CC
_080BE618: .4byte 0x0202BCEC
_080BE61C:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080BE658
	adds r0, r4, #0
	bl sub_80BE3F8
	adds r1, r0, #0
	cmp r1, #0
	blt _080BE658
	b _080BE64A
_080BE634:
	ldr r0, _080BE654 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BE658
	bl sub_80BE44C
	adds r1, r0, #0
_080BE64A:
	adds r0, r4, #0
	bl sub_80BE4B8
	b _080BE686
	.align 2, 0
_080BE654: .4byte 0x085775CC
_080BE658:
	ldr r0, _080BE670 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BE674
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080BE686
	.align 2, 0
_080BE670: .4byte 0x085775CC
_080BE674:
	adds r0, r4, #0
	bl sub_80BE2A8
	ldr r0, _080BE690 @ =0x03005270
	str r5, [r0, #8]
	str r6, [r0, #0xc]
	adds r0, r4, #0
	bl WmMain_MoveCamera
_080BE686:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE690: .4byte 0x03005270

