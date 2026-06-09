	.syntax unified
	.set sub_8034B20, 0x08034B20 + 1
	.section .text.sub_80299B8, "ax", %progbits
@ sub_80299B8 @ JP 0x080299B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80299B8
	.thumb_func
sub_80299B8:
	push {lr}
	bl sub_8034B20
	pop {r0}
	bx r0
	.align 2, 0

