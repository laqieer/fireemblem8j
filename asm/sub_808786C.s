	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.section .text.sub_808786C, "ax", %progbits
@ sub_808786C @ JP 0x0808786C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808786C
	.thumb_func
sub_808786C:
	push {r4, lr}
	sub sp, #4
	adds r0, #0x4d
	movs r4, #1
	strb r4, [r0]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

