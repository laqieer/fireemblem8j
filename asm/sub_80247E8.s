	.syntax unified
	.set sub_8034EA4, 0x08034EA4 + 1
	.section .text.sub_80247E8, "ax", %progbits
@ sub_80247E8 @ JP 0x080247E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80247E8
	.thumb_func
sub_80247E8:
	push {lr}
	bl sub_8034EA4
	pop {r0}
	bx r0
	.align 2, 0

