	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_8063760, "ax", %progbits
@ sub_8063760 @ JP 0x08063760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063760
	.thumb_func
sub_8063760:
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _08063774 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08063774: .4byte 0x0201774C

