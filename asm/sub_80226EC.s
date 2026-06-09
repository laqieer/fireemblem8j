	.syntax unified
	.set sub_80AEFFC, 0x080AEFFC + 1
	.section .text.sub_80226EC, "ax", %progbits
@ sub_80226EC @ JP 0x080226EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80226EC
	.thumb_func
sub_80226EC:
	push {lr}
	movs r0, #3
	bl sub_80AEFFC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

