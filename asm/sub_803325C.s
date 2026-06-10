	.syntax unified
	.set sub_8099594, 0x08099594 + 1
	.section .text.sub_803325C, "ax", %progbits
@ sub_803325C @ JP 0x0803325C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803325C
	.thumb_func
sub_803325C:
	push {lr}
	bl sub_8099594
	pop {r0}
	bx r0
	.align 2, 0

