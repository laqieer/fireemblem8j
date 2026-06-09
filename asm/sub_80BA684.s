	.syntax unified
	.set sub_801496C, 0x0801496C + 1
	.section .text.sub_80BA684, "ax", %progbits
@ sub_80BA684 @ JP 0x080BA684 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA684
	.thumb_func
sub_80BA684:
	push {lr}
	bl sub_801496C
	pop {r0}
	bx r0
	.align 2, 0

