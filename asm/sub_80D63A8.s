	.syntax unified
	.section .text.sub_80D63A8, "ax", %progbits
@ RLUnCompWram @ JP 0x080D63A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RLUnCompWram
	.thumb_func
RLUnCompWram:
	svc #0x14
	bx lr

