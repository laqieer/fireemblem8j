	.syntax unified
	.section .text.SnycKeyStatus, "ax", %progbits
@ SnycKeyStatus @ JP 0x080013D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SnycKeyStatus
	.thumb_func
SnycKeyStatus:
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #6]
	strh r1, [r0, #4]
	bx lr
	.align 2, 0

