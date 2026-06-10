	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8021D2C, "ax", %progbits
@ sub_8021D2C @ JP 0x08021D2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021D2C
	.thumb_func
sub_8021D2C:
	push {r4, lr}
	sub sp, #4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r4, #1
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	bl sub_804F610
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

