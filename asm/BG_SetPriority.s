	.syntax unified
	.section .text.BG_SetPriority, "ax", %progbits
@ BG_SetPriority @ JP 0x08001DBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_SetPriority
	.thumb_func
BG_SetPriority:
	ldr r2, _08001DD8 @ =0x085775F8
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #3
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_08001DD8: .4byte 0x085775F8

