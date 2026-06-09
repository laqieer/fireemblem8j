	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_80BA628, "ax", %progbits
@ sub_80BA628 @ JP 0x080BA628 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA628
	.thumb_func
sub_80BA628:
	push {lr}
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_800226C
	pop {r0}
	bx r0
	.align 2, 0

