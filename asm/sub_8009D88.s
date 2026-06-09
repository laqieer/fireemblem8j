	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.section .text.sub_8009D88, "ax", %progbits
@ sub_8009D88 @ JP 0x08009D88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009D88
	.thumb_func
sub_8009D88:
	push {lr}
	sub sp, #4
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

