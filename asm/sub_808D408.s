	.syntax unified
	.set GetFaceDisplayBitsById, 0x080056B0 + 1
	.set SetFaceDisplayBitsById, 0x08005694 + 1
	.set sub_808C834, 0x0808C834 + 1
	.section .text.sub_808D408, "ax", %progbits
@ sub_808D408 @ JP 0x0808D408 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808D408
	.thumb_func
sub_808D408:
	push {lr}
	bl sub_808C834
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808D426
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r1, r0
	movs r0, #0
	bl SetFaceDisplayBitsById
_0808D426:
	pop {r0}
	bx r0
	.align 2, 0

