	.syntax unified
	.section .text.ClearBgsModified, "ax", %progbits
@ ClearBgsModified @ JP 0x08001F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearBgsModified
	.thumb_func
ClearBgsModified:
	ldr r2, _08001F2C @ =0x0300000C
	ldrb r1, [r2]
	bics r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001F2C: .4byte 0x0300000C

