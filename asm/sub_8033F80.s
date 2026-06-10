	.syntax unified
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_8033F80, "ax", %progbits
@ sub_8033F80 @ JP 0x08033F80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033F80
	.thumb_func
sub_8033F80:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_8001ACC
	adds r0, r4, #0
	bl sub_80B2874
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

