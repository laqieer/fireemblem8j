	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.ClearNativeCallback, "ax", %progbits
@ ClearNativeCallback @ JP 0x08002FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearNativeCallback
	.thumb_func
ClearNativeCallback:
	push {lr}
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

