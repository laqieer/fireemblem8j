	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_80BCE94, "ax", %progbits
@ sub_80BCE94 @ JP 0x080BCE94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCE94
	.thumb_func
sub_80BCE94:
	push {lr}
	movs r0, #3
	bl sub_800226C
	pop {r0}
	bx r0

