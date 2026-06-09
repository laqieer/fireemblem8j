	.syntax unified
	.set sub_807B180, 0x0807B180 + 1
	.section .text.sub_807ACAC, "ax", %progbits
@ sub_807ACAC @ JP 0x0807ACAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807ACAC
	.thumb_func
sub_807ACAC:
	push {lr}
	bl sub_807B180
	pop {r0}
	bx r0
	.align 2, 0

