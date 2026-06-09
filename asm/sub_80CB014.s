	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80CAEC0, 0x080CAEC0 + 1
	.section .text.sub_80CB014, "ax", %progbits
@ sub_80CB014 @ JP 0x080CB014 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB014
	.thumb_func
sub_80CB014:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
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
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	str r4, [r5, #0x30]
	bl sub_80CAEC0
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

