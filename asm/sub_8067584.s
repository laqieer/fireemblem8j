	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_8067584, "ax", %progbits
@ sub_8067584 @ JP 0x08067584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067584
	.thumb_func
sub_8067584:
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _08067598 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08067598: .4byte 0x0201774C

