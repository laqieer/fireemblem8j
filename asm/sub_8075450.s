	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8075450, "ax", %progbits
@ sub_8075450 @ JP 0x08075450 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075450
	.thumb_func
sub_8075450:
	push {lr}
	ldrh r1, [r0, #0x2c]
	adds r1, #1
	strh r1, [r0, #0x2c]
	bl sub_8002DE4
	pop {r0}
	bx r0

