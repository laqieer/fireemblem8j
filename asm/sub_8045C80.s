	.syntax unified
	.set sub_80418FC, 0x080418FC + 1
	.section .text.sub_8045C80, "ax", %progbits
@ sub_8045C80 @ JP 0x08045C80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045C80
	.thumb_func
sub_8045C80:
	push {lr}
	bl sub_80418FC
	pop {r0}
	bx r0
	.align 2, 0

