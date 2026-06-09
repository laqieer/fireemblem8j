	.syntax unified
	.section .text.BG_GetPriority, "ax", %progbits
@ BG_GetPriority @ JP 0x08001DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_GetPriority
	.thumb_func
BG_GetPriority:
	ldr r1, _08001DEC @ =0x085775F8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bx lr
	.align 2, 0
_08001DEC: .4byte 0x085775F8

