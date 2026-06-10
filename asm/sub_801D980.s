	.syntax unified
	.set InitBmBgLayers, 0x08015624 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_801D980, "ax", %progbits
@ sub_801D980 @ JP 0x0801D980 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D980
	.thumb_func
sub_801D980:
	push {r4, lr}
	sub sp, #4
	adds r0, #0x4c
	movs r4, #0
	movs r1, #0x10
	strh r1, [r0]
	bl InitBmBgLayers
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

