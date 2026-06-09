	.syntax unified
	.set GetFaceDisplayBitsById, 0x080056B0 + 1
	.set SetFaceDisplayBitsById, 0x08005694 + 1
	.set sub_808C834, 0x0808C834 + 1
	.section .text.sub_808D3E4, "ax", %progbits
@ sub_808D3E4 @ JP 0x0808D3E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808D3E4
	.thumb_func
sub_808D3E4:
	push {lr}
	bl sub_808C834
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808D404
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDisplayBitsById
_0808D404:
	pop {r0}
	bx r0

