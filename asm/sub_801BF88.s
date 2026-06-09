	.syntax unified
	.set sub_80AEFFC, 0x080AEFFC + 1
	.section .text.sub_801BF88, "ax", %progbits
@ sub_801BF88 @ JP 0x0801BF88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BF88
	.thumb_func
sub_801BF88:
	push {lr}
	movs r0, #3
	bl sub_80AEFFC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

