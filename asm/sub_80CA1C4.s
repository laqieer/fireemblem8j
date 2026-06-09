	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_80CA1C4, "ax", %progbits
@ sub_80CA1C4 @ JP 0x080CA1C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA1C4
	.thumb_func
sub_80CA1C4:
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0

