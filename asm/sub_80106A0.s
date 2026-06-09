	.syntax unified
	.set sub_800BF3C, 0x0800BF3C + 1
	.section .text.sub_80106A0, "ax", %progbits
@ sub_80106A0 @ JP 0x080106A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80106A0
	.thumb_func
sub_80106A0:
	push {r4, r5, r6, r7, lr}
	ldr r2, [r0, #0x38]
	movs r1, #2
	ldrsh r0, [r2, r1]
	ldrh r1, [r2, #4]
	movs r4, #4
	ldrsb r4, [r2, r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r7, r1, #0
	ldrh r2, [r2, #6]
	adds r1, r2, r4
	subs r1, #1
	lsls r1, r1, #0x18
	asrs r5, r1, #0x18
	lsrs r2, r2, #8
	adds r2, r2, r7
	subs r2, #1
	lsls r2, r2, #0x18
	asrs r6, r2, #0x18
	bl sub_800BF3C
	adds r1, r0, #0
	ldr r2, _080106F8 @ =0x030004B0
	movs r0, #0
	str r0, [r2, #0x30]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, r4
	blt _080106F0
	cmp r5, r0
	blt _080106F0
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, r7
	blt _080106F0
	cmp r6, r0
	blt _080106F0
	movs r0, #1
	str r0, [r2, #0x30]
_080106F0:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080106F8: .4byte 0x030004B0

