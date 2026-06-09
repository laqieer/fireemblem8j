	.syntax unified
	.set sub_807B4D4, 0x0807B4D4 + 1
	.section .text.sub_807B4C8, "ax", %progbits
@ sub_807B4C8 @ JP 0x0807B4C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B4C8
	.thumb_func
sub_807B4C8:
	push {lr}
	bl sub_807B4D4
	pop {r0}
	bx r0
	.align 2, 0

