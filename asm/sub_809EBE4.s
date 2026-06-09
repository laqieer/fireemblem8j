	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.section .text.sub_809EBE4, "ax", %progbits
@ sub_809EBE4 @ JP 0x0809EBE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EBE4
	.thumb_func
sub_809EBE4:
	push {lr}
	bl sub_8097D18
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

