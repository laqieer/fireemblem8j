	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80D3C0C, "ax", %progbits
@ sub_80D3C0C @ JP 0x080D3C0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D3C0C
	.thumb_func
sub_80D3C0C:
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xf
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
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

