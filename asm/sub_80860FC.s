	.syntax unified
	.section .text.sub_80860FC, "ax", %progbits
@ sub_80860FC @ JP 0x080860FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80860FC
	.thumb_func
sub_80860FC:
	movs r0, #5
	bx lr

