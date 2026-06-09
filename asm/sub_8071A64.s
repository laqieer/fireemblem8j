	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_8071A64, "ax", %progbits
@ sub_8071A64 @ JP 0x08071A64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071A64
	.thumb_func
sub_8071A64:
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

