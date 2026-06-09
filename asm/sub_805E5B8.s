	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.section .text.sub_805E5B8, "ax", %progbits
@ sub_805E5B8 @ JP 0x0805E5B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E5B8
	.thumb_func
sub_805E5B8:
	push {lr}
	ldr r2, _0805E5CC @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805E5CC: .4byte 0x0201774C

