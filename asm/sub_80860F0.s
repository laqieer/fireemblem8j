	.syntax unified
	.section .text.sub_80860F0, "ax", %progbits
@ sub_80860F0 @ JP 0x080860F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80860F0
	.thumb_func
sub_80860F0:
	movs r0, #0x19
	bx lr

