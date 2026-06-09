	.syntax unified
	.section .text.sub_8006274, "ax", %progbits
@ sub_8006274 @ JP 0x08006274 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006274
	.thumb_func
sub_8006274:
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

