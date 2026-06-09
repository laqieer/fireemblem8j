	.syntax unified
	.section .text.sub_8001EE4, "ax", %progbits
@ sub_8001EE4 @ JP 0x08001EE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001EE4
	.thumb_func
sub_8001EE4:
	ldr r1, _08001EEC @ =0x0300000D
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001EEC: .4byte 0x0300000D

