	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_80616E8, "ax", %progbits
@ sub_80616E8 @ JP 0x080616E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80616E8
	.thumb_func
sub_80616E8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08061740 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061744 @ =0x08600844
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08061748 @ =0x085FF1C0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r1, [r6, #8]
	ldr r0, _0806174C @ =0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08061750
	ldrh r0, [r6, #2]
	subs r0, #8
	b _08061754
	.align 2, 0
_08061740: .4byte 0x0201774C
_08061744: .4byte 0x08600844
_08061748: .4byte 0x085FF1C0
_0806174C: .4byte 0x0000F3FF
_08061750:
	ldrh r0, [r6, #2]
	adds r0, #8
_08061754:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

