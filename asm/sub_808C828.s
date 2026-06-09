	.syntax unified
	.section .text.sub_808C828, "ax", %progbits
@ sub_808C828 @ JP 0x0808C828 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C828
	.thumb_func
sub_808C828:
	ldr r1, _0808C830 @ =0x0203E7E4
	adds r1, #0x42
	strh r0, [r1]
	bx lr
	.align 2, 0
_0808C830: .4byte 0x0203E7E4

