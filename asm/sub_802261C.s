	.syntax unified
	.set sub_8090A38, 0x08090A38 + 1
	.section .text.sub_802261C, "ax", %progbits
@ sub_802261C @ JP 0x0802261C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802261C
	.thumb_func
sub_802261C:
	push {lr}
	movs r0, #0
	bl sub_8090A38
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

