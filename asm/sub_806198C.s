	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_806198C, "ax", %progbits
@ sub_806198C @ JP 0x0806198C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806198C
	.thumb_func
sub_806198C:
	push {lr}
	ldr r2, _080619A0 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_080619A0: .4byte 0x0201774C

