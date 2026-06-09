	.syntax unified
	.set RememberBlendState, 0x080C4598 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80C4974, "ax", %progbits
@ sub_80C4974 @ JP 0x080C4974 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4974
	.thumb_func
sub_80C4974:
	push {r4, lr}
	sub sp, #4
	adds r0, #0x30
	bl RememberBlendState
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

