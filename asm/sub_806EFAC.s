	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806EFAC, "ax", %progbits
@ sub_806EFAC @ JP 0x0806EFAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EFAC
	.thumb_func
sub_806EFAC:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

