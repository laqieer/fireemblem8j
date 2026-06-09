	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80BBCF8, "ax", %progbits
@ sub_80BBCF8 @ JP 0x080BBCF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBCF8
	.thumb_func
sub_80BBCF8:
	push {r4, lr}
	sub sp, #4
	movs r4, #0
	str r4, [r0, #0x34]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

