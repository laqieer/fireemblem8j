	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_8061764, "ax", %progbits
@ sub_8061764 @ JP 0x08061764 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061764
	.thumb_func
sub_8061764:
	push {lr}
	ldr r2, _08061778 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08061778: .4byte 0x0201774C

