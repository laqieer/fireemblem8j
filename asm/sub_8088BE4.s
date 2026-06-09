	.syntax unified
	.set sub_80AEFFC, 0x080AEFFC + 1
	.section .text.sub_8088BE4, "ax", %progbits
@ sub_8088BE4 @ JP 0x08088BE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088BE4
	.thumb_func
sub_8088BE4:
	push {lr}
	bl sub_80AEFFC
	pop {r0}
	bx r0
	.align 2, 0

