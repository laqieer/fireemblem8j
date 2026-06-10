	.syntax unified
	.section .text.Sio_SetSubState, "ax", %progbits
@ Sio_SetSubState @ JP 0x08042904 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_SetSubState
	.thumb_func
Sio_SetSubState:
	ldr r1, _08042910 @ =0x085D31E8
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_08042910: .4byte 0x085D31E8

