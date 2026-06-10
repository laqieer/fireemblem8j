	.syntax unified
	.set Sio_SetSubState, 0x08042904 + 1
	.section .text.sub_8046918, "ax", %progbits
@ sub_8046918 @ JP 0x08046918 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046918
	.thumb_func
sub_8046918:
	push {lr}
	movs r0, #0
	bl Sio_SetSubState
	pop {r0}
	bx r0

