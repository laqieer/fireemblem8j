	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_8042E38, "ax", %progbits
@ sub_8042E38 @ JP 0x08042E38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042E38
	.thumb_func
sub_8042E38:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	str r4, [r5, #0x58]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

