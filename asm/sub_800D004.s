	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.section .text.sub_800D004, "ax", %progbits
@ sub_800D004 @ JP 0x0800D004 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D004
	.thumb_func
sub_800D004:
	push {lr}
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

