	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8078DBC, "ax", %progbits
@ sub_8078DBC @ JP 0x08078DBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078DBC
	.thumb_func
sub_8078DBC:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

