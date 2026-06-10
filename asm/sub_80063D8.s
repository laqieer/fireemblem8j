	.syntax unified
	.section .text.sub_80063D8, "ax", %progbits
@ sub_80063D8 @ JP 0x080063D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80063D8
	.thumb_func
sub_80063D8:
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

