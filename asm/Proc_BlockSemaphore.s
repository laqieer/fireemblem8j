	.syntax unified
	.section .text.Proc_BlockSemaphore, "ax", %progbits
@ Proc_BlockSemaphore @ JP 0x080033A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_BlockSemaphore
	.thumb_func
Proc_BlockSemaphore:
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

