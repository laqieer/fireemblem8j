	.syntax unified
	.set sub_801D730, 0x0801D730 + 1
	.section .text.sub_8022C60, "ax", %progbits
@ sub_8022C60 @ JP 0x08022C60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022C60
	.thumb_func
sub_8022C60:
	push {lr}
	bl sub_801D730
	movs r0, #0
	pop {r1}
	bx r1

