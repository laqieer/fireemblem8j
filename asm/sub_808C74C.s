	.syntax unified
	.section .text.sub_808C74C, "ax", %progbits
@ sub_808C74C @ JP 0x0808C74C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C74C
	.thumb_func
sub_808C74C:
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	bx lr
	.align 2, 0

