	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_804FC34, 0x0804FC34 + 1
	.section .text.sub_801B998, "ax", %progbits
@ sub_801B998 @ JP 0x0801B998 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B998
	.thumb_func
sub_801B998:
	push {lr}
	bl sub_804FC34
	movs r0, #0
	bl EndFaceById
	bl sub_804F610
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

