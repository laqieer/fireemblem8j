	.syntax unified
	.section .text.ProcCmd_LOOP_ROUTINE, "ax", %progbits
@ ProcCmd_LOOP_ROUTINE @ JP 0x080030C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ProcCmd_LOOP_ROUTINE
	.thumb_func
ProcCmd_LOOP_ROUTINE:
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0xc]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #0
	bx lr
	.align 2, 0

