	.syntax unified
	.set sub_8023318, 0x08023318 + 1
	.section .text.sub_801DD94, "ax", %progbits
@ sub_801DD94 @ JP 0x0801DD94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DD94
	.thumb_func
sub_801DD94:
	push {lr}
	bl sub_8023318
	pop {r1}
	bx r1
	.align 2, 0

