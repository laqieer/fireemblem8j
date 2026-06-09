	.syntax unified
	.section .text.Proc_WakeSemaphore, "ax", %progbits
@ Proc_WakeSemaphore @ JP 0x080033AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_WakeSemaphore
	.thumb_func
Proc_WakeSemaphore:
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

