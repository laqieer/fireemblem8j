	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_80CA1B8, "ax", %progbits
@ sub_80CA1B8 @ JP 0x080CA1B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA1B8
	.thumb_func
sub_80CA1B8:
	push {lr}
	movs r0, #4
	bl sub_800226C
	pop {r0}
	bx r0

