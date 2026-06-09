	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806FC9C, "ax", %progbits
@ sub_806FC9C @ JP 0x0806FC9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FC9C
	.thumb_func
sub_806FC9C:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

