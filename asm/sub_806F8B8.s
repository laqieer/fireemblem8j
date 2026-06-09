	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F8B8, "ax", %progbits
@ sub_806F8B8 @ JP 0x0806F8B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F8B8
	.thumb_func
sub_806F8B8:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

