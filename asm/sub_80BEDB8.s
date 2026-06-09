	.syntax unified
	.set sub_80C8DC4, 0x080C8DC4 + 1
	.section .text.sub_80BEDB8, "ax", %progbits
@ sub_80BEDB8 @ JP 0x080BEDB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEDB8
	.thumb_func
sub_80BEDB8:
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	bl sub_80C8DC4
	pop {r0}
	bx r0
	.align 2, 0

