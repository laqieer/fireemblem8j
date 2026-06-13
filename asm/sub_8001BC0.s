	.syntax unified
	.section .text.BG_GetMapBuffer, "ax", %progbits
@ BG_GetMapBuffer @ JP 0x08001BC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_GetMapBuffer
	.thumb_func
BG_GetMapBuffer:
	ldr r1, _08001BCC @ =0x085775E8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08001BCC: .4byte 0x085775E8

