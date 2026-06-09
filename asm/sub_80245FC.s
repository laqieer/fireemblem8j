	.syntax unified
	.set sub_8034EA4, 0x08034EA4 + 1
	.section .text.sub_80245FC, "ax", %progbits
@ sub_80245FC @ JP 0x080245FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80245FC
	.thumb_func
sub_80245FC:
	push {lr}
	bl sub_8034EA4
	pop {r0}
	bx r0
	.align 2, 0

