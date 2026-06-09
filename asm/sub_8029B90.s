	.syntax unified
	.set sub_8034F04, 0x08034F04 + 1
	.section .text.sub_8029B90, "ax", %progbits
@ sub_8029B90 @ JP 0x08029B90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029B90
	.thumb_func
sub_8029B90:
	push {lr}
	bl sub_8034F04
	pop {r1}
	bx r1
	.align 2, 0

