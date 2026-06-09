	.syntax unified
	.set sub_8013DD8, 0x08013DD8 + 1
	.section .text.sub_8013EA8, "ax", %progbits
@ sub_8013EA8 @ JP 0x08013EA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013EA8
	.thumb_func
sub_8013EA8:
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8013DD8
	pop {r0}
	bx r0
	.align 2, 0

