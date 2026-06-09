	.syntax unified
	.set sub_801D730, 0x0801D730 + 1
	.section .text.sub_8023B48, "ax", %progbits
@ sub_8023B48 @ JP 0x08023B48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023B48
	.thumb_func
sub_8023B48:
	push {lr}
	bl sub_801D730
	movs r0, #0
	pop {r1}
	bx r1

