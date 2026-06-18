	.syntax unified
	.section .text.sub_80D63A4, "ax", %progbits
@ RLUnCompVram @ JP 0x080D63A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RLUnCompVram
	.thumb_func
RLUnCompVram:
	svc #0x15
	bx lr

