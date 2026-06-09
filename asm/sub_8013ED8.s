	.syntax unified
	.set sub_8013E08, 0x08013E08 + 1
	.section .text.sub_8013ED8, "ax", %progbits
@ sub_8013ED8 @ JP 0x08013ED8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013ED8
	.thumb_func
sub_8013ED8:
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8013E08
	pop {r0}
	bx r0
	.align 2, 0

