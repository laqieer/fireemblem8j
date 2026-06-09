	.syntax unified
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_80C1484, "ax", %progbits
@ sub_80C1484 @ JP 0x080C1484 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1484
	.thumb_func
sub_80C1484:
	push {lr}
	bl sub_804F610
	movs r0, #0
	pop {r1}
	bx r1

