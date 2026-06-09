	.syntax unified
	.set SetBlendTargetA, 0x08001E20 + 1
	.section .text.sub_80CBA5C, "ax", %progbits
@ sub_80CBA5C @ JP 0x080CBA5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBA5C
	.thumb_func
sub_80CBA5C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080CBA94 @ =0x03003020
	adds r3, r2, #0
	adds r3, #0x3c
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x46
	movs r5, #0
	strb r5, [r2]
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	adds r4, #0x4c
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBA94: .4byte 0x03003020

