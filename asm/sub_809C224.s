	.syntax unified
	.set sub_809C178, 0x0809C178 + 1
	.section .text.sub_809C224, "ax", %progbits
@ sub_809C224 @ JP 0x0809C224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C224
	.thumb_func
sub_809C224:
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_809C178
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

