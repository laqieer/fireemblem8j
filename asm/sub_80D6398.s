	.syntax unified
	.section .text.sub_80D6398, "ax", %progbits
@ MultiBoot @ JP 0x080D6398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MultiBoot
	.thumb_func
MultiBoot:
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0

