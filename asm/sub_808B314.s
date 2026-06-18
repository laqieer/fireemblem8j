	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_808B5E0, 0x0808B5E0 + 1
	.set sub_808B610, 0x0808B610 + 1
	.set sub_808B640, 0x0808B640 + 1
	.set sub_808B670, 0x0808B670 + 1
	.section .text.sub_808B314, "ax", %progbits
@ HbMoveCtrl_OnIdle @ JP 0x0808B314 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HbMoveCtrl_OnIdle
	.thumb_func
HbMoveCtrl_OnIdle:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r1, _0808B3AC @ =0x0203E784
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r5, #0x2c]
	lsls r0, r0, #3
	ldrb r3, [r2, #0x10]
	adds r0, r0, r3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	ldrb r2, [r2, #0x11]
	adds r1, r1, r2
	bl sub_804F528
	ldr r6, _0808B3B0 @ =0x085775CC
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808B34E
	adds r0, r5, #0
	bl sub_808B5E0
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
_0808B34E:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808B366
	adds r0, r5, #0
	bl sub_808B610
	orrs r4, r0
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
_0808B366:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0808B37E
	adds r0, r5, #0
	bl sub_808B640
	orrs r4, r0
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
_0808B37E:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808B396
	adds r0, r5, #0
	bl sub_808B670
	orrs r4, r0
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
_0808B396:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808B3B4
	adds r0, r5, #0
	bl sub_8002DE4
	b _0808B3D2
	.align 2, 0
_0808B3AC: .4byte 0x0203E784
_0808B3B0: .4byte 0x085775CC
_0808B3B4:
	cmp r4, #0
	beq _0808B3D2
	ldr r0, _0808B3D8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808B3CA
	movs r0, #0x67
	bl m4aSongNumStart
_0808B3CA:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_0808B3D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3D8: .4byte 0x0202BCEC

