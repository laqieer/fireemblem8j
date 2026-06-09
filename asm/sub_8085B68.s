	.syntax unified
	.section .text.sub_8085B68, "ax", %progbits
@ sub_8085B68 @ JP 0x08085B68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085B68
	.thumb_func
sub_8085B68:
	movs r0, #1
	bx lr

