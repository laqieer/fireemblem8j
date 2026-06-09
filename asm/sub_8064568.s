	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_8064568, "ax", %progbits
@ sub_8064568 @ JP 0x08064568 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064568
	.thumb_func
sub_8064568:
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0806457C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806457C: .4byte 0x0201774C

