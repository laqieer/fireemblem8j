	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80B7C6C, "ax", %progbits
@ sub_80B7C6C @ JP 0x080B7C6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7C6C
	.thumb_func
sub_80B7C6C:
	push {lr}
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0

