	.syntax unified
	.set Sio_SetSubState, 0x08042904 + 1
	.section .text.sub_804690C, "ax", %progbits
@ sub_804690C @ JP 0x0804690C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804690C
	.thumb_func
sub_804690C:
	push {lr}
	movs r0, #3
	bl Sio_SetSubState
	pop {r0}
	bx r0

