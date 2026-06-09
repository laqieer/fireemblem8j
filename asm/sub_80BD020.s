	.syntax unified
	.set sub_80B0238, 0x080B0238 + 1
	.section .text.sub_80BD020, "ax", %progbits
@ sub_80BD020 @ JP 0x080BD020 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD020
	.thumb_func
sub_80BD020:
	push {lr}
	bl sub_80B0238
	pop {r1}
	bx r1
	.align 2, 0

