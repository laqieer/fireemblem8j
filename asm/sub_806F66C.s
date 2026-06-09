	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F66C, "ax", %progbits
@ sub_806F66C @ JP 0x0806F66C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F66C
	.thumb_func
sub_806F66C:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

