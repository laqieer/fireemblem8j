	.syntax unified
	.set sub_8006890, 0x08006890 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8006934, "ax", %progbits
@ sub_8006934 @ JP 0x08006934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006934
	.thumb_func
sub_8006934:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl sub_8009FA8
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8006890
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

