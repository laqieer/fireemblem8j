	.syntax unified
	.set sub_802F134, 0x0802F134 + 1
	.section .text.sub_802FFA0, "ax", %progbits
@ sub_802FFA0 @ JP 0x0802FFA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FFA0
	.thumb_func
sub_802FFA0:
	push {lr}
	bl sub_802F134
	pop {r0}
	bx r0
	.align 2, 0

