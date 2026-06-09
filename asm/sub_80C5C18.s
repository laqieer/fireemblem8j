	.syntax unified
	.set sub_8089078, 0x08089078 + 1
	.section .text.sub_80C5C18, "ax", %progbits
@ sub_80C5C18 @ JP 0x080C5C18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5C18
	.thumb_func
sub_80C5C18:
	push {lr}
	bl sub_8089078
	pop {r0}
	bx r0
	.align 2, 0

