	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8076774, "ax", %progbits
@ sub_8076774 @ JP 0x08076774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076774
	.thumb_func
sub_8076774:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

