	.syntax unified
	.set sub_808B7E0, 0x0808B7E0 + 1
	.section .text.sub_80AEF98, "ax", %progbits
@ sub_80AEF98 @ JP 0x080AEF98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEF98
	.thumb_func
sub_80AEF98:
	push {lr}
	bl sub_808B7E0
	pop {r0}
	bx r0
	.align 2, 0

