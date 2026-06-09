	.syntax unified
	.section .text.BG_EnableSync, "ax", %progbits
@ BG_EnableSync @ JP 0x08001F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_EnableSync
	.thumb_func
BG_EnableSync:
	ldr r2, _08001F1C @ =0x0300000C
	movs r1, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001F1C: .4byte 0x0300000C

