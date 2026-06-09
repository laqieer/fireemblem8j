	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_8056708, 0x08056708 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806B728, "ax", %progbits
@ sub_806B728 @ JP 0x0806B728 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B728
	.thumb_func
sub_806B728:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x11
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	beq _0806B73E
	rsbs r4, r4, #0
_0806B73E:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	movs r2, #0
	bl BG_SetPosition
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806B788
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8056708
	b _0806B7A6
_0806B788:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0806B7A6
	bl sub_8056130
	ldr r1, _0806B7AC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r6, #0
	bl sub_8002DE4
_0806B7A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B7AC: .4byte 0x0201774C

