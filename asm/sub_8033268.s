	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_803325C, 0x0803325C + 1
	.section .text.sub_8033268, "ax", %progbits
@ sub_8033268 @ JP 0x08033268 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033268
	.thumb_func
sub_8033268:
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl sub_8002DE4
	bl sub_803325C
	pop {r0}
	bx r0
	.align 2, 0

