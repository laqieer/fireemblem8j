	.syntax unified
	.section .text.sub_804C6C0, "ax", %progbits
@ sub_804C6C0 @ JP 0x0804C6C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C6C0
	.thumb_func
sub_804C6C0:
	ldr r1, _0804C6C8 @ =0x0203DDD8
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804C6C8: .4byte 0x0203DDD8

