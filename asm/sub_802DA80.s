	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.section .text.sub_802DA80, "ax", %progbits
@ sub_802DA80 @ JP 0x0802DA80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DA80
	.thumb_func
sub_802DA80:
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

