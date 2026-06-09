	.syntax unified
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_80C12E4, "ax", %progbits
@ sub_80C12E4 @ JP 0x080C12E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C12E4
	.thumb_func
sub_80C12E4:
	push {lr}
	bl sub_804F610
	movs r0, #0
	pop {r1}
	bx r1

