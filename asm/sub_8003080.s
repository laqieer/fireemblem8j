	.syntax unified
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_8003080, "ax", %progbits
@ sub_8003080 @ JP 0x08003080 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003080
	.thumb_func
sub_8003080:
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #4]
	movs r3, #2
	ldrsh r0, [r2, r3]
	ldr r3, [r2, #4]
	adds r2, #8
	str r2, [r1, #4]
	bl sub_80D65C8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

