	.syntax unified
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.section .text.sub_8074E80, "ax", %progbits
@ sub_8074E80 @ JP 0x08074E80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074E80
	.thumb_func
sub_8074E80:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_8073E74
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8073F94
	pop {r4, r5, r6}
	pop {r0}
	bx r0

