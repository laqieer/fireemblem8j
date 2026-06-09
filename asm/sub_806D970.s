	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_806D970, "ax", %progbits
@ sub_806D970 @ JP 0x0806D970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D970
	.thumb_func
sub_806D970:
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0806D984 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806D984: .4byte 0x0201774C

