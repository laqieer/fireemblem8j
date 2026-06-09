	.syntax unified
	.section .text.ProcCmd_SET_BIT4, "ax", %progbits
@ ProcCmd_SET_BIT4 @ JP 0x080032C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ProcCmd_SET_BIT4
	.thumb_func
ProcCmd_SET_BIT4:
	adds r3, r0, #0
	adds r3, #0x27
	ldrb r2, [r3]
	movs r1, #4
	orrs r1, r2
	strb r1, [r3]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

