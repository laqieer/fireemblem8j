	.syntax unified
	.section .text.sub_80D63D8, "ax", %progbits
@ VBlankIntrWait @ JP 0x080D63D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global VBlankIntrWait
	.thumb_func
VBlankIntrWait:
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

