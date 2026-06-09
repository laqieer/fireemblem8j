	.syntax unified
	.set sub_8035848, 0x08035848 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8029CB4, "ax", %progbits
@ sub_8029CB4 @ JP 0x08029CB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029CB4
	.thumb_func
sub_8029CB4:
	push {lr}
	bl sub_8035848
	bl sub_804F610
	pop {r0}
	bx r0
	.align 2, 0

