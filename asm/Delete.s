	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.Delete, "ax", %progbits
@ Delete @ JP 0x08002FBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Delete
	.thumb_func
Delete:
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0

