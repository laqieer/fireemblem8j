	.syntax unified
	.section .text.sub_8001EF0, "ax", %progbits
@ sub_8001EF0 @ JP 0x08001EF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001EF0
	.thumb_func
sub_8001EF0:
	ldr r1, _08001EF8 @ =0x0300000D
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001EF8: .4byte 0x0300000D

