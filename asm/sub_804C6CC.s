	.syntax unified
	.section .text.sub_804C6CC, "ax", %progbits
@ sub_804C6CC @ JP 0x0804C6CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C6CC
	.thumb_func
sub_804C6CC:
	ldr r1, _0804C6D4 @ =0x0203DDD8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804C6D4: .4byte 0x0203DDD8

