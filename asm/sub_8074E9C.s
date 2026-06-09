	.syntax unified
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_8074DE8, 0x08074DE8 + 1
	.section .text.sub_8074E9C, "ax", %progbits
@ sub_8074E9C @ JP 0x08074E9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074E9C
	.thumb_func
sub_8074E9C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl sub_8073E74
	adds r0, r4, #0
	bl sub_8074DE8
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl sub_8073F94
	pop {r4, r5}
	pop {r0}
	bx r0

