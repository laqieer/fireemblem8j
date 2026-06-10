	.syntax unified
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_8043A88, "ax", %progbits
@ sub_8043A88 @ JP 0x08043A88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043A88
	.thumb_func
sub_8043A88:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, _08043AE8 @ =0x085775CC
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08043ABE
	ldr r0, [r4]
	cmp r0, r5
	bgt _08043AB2
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08043ABE
_08043AB2:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _08043ABE
	subs r0, r6, #1
	str r0, [r4]
_08043ABE:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08043AE2
	ldr r0, [r4]
	cmp r0, r7
	blt _08043AD6
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08043AE2
_08043AD6:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
_08043AE2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043AE8: .4byte 0x085775CC

