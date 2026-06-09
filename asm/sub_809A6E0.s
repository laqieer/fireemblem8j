	.syntax unified
	.set sub_8098768, 0x08098768 + 1
	.section .text.sub_809A6E0, "ax", %progbits
@ sub_809A6E0 @ JP 0x0809A6E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A6E0
	.thumb_func
sub_809A6E0:
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x34]
	str r0, [r4, #0x48]
	str r0, [r4, #0x44]
	bl sub_8098768
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

