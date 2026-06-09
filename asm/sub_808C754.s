	.syntax unified
	.section .text.sub_808C754, "ax", %progbits
@ sub_808C754 @ JP 0x0808C754 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C754
	.thumb_func
sub_808C754:
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

