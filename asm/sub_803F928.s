	.syntax unified
	.set sub_803BA10, 0x0803BA10 + 1
	.section .text.sub_803F928, "ax", %progbits
@ sub_803F928 @ JP 0x0803F928 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F928
	.thumb_func
sub_803F928:
	push {lr}
	sub sp, #4
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	movs r0, #1
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0

