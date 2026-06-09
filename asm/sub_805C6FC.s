	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805C6FC, "ax", %progbits
@ sub_805C6FC @ JP 0x0805C6FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C6FC
	.thumb_func
sub_805C6FC:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

