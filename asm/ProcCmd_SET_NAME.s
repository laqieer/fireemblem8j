	.syntax unified
	.section .text.ProcCmd_SET_NAME, "ax", %progbits
@ ProcCmd_SET_NAME @ JP 0x08003044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ProcCmd_SET_NAME
	.thumb_func
ProcCmd_SET_NAME:
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0x10]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

