	.syntax unified
	.section .text.sub_80DA938, "ax", %progbits
@ isatty @ JP 0x080DA938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global isatty
	.thumb_func
isatty:
	movs r0, #1
	bx lr

