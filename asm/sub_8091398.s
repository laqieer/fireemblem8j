	.syntax unified
	.set GetFaceDisplayBitsById, 0x080056B0 + 1
	.set SetFaceDisplayBitsById, 0x08005694 + 1
	.set SetSecondaryHBlankHandler, 0x08001D3C + 1
	.set sub_8091358, 0x08091358 + 1
	.section .text.sub_8091398, "ax", %progbits
@ sub_8091398 @ JP 0x08091398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8091398
	.thumb_func
sub_8091398:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDisplayBitsById
	adds r0, r4, #0
	bl sub_8091358
	movs r0, #0
	bl SetSecondaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

