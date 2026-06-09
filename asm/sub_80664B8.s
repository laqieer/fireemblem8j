	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_80664B8, "ax", %progbits
@ sub_80664B8 @ JP 0x080664B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80664B8
	.thumb_func
sub_80664B8:
	push {lr}
	ldr r2, _080664CC @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_080664CC: .4byte 0x0201774C

