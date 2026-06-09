	.syntax unified
	.set Sio_GetPendingSendCount, 0x080421B8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_804AB00, "ax", %progbits
@ sub_804AB00 @ JP 0x0804AB00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AB00
	.thumb_func
sub_804AB00:
	push {r4, lr}
	adds r4, r0, #0
	bl Sio_GetPendingSendCount
	cmp r0, #7
	bgt _0804AB12
	adds r0, r4, #0
	bl sub_8002DE4
_0804AB12:
	pop {r4}
	pop {r0}
	bx r0

