	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_8056120, "ax", %progbits
@ sub_8056120 @ JP 0x08056120 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056120
	.thumb_func
sub_8056120:
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0

