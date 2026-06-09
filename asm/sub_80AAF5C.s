	.syntax unified
	.section .text.sub_80AAF5C, "ax", %progbits
@ sub_80AAF5C @ JP 0x080AAF5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AAF5C
	.thumb_func
sub_80AAF5C:
	sub sp, #8
	add sp, #8
	bx lr
	.align 2, 0

