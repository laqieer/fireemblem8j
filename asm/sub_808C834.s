	.syntax unified
	.section .text.sub_808C834, "ax", %progbits
@ sub_808C834 @ JP 0x0808C834 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C834
	.thumb_func
sub_808C834:
	ldr r0, _0808C83C @ =0x0203E7E4
	adds r0, #0x42
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0808C83C: .4byte 0x0203E7E4

