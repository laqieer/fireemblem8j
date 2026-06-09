	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.section .text.sub_80142C4, "ax", %progbits
@ sub_80142C4 @ JP 0x080142C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80142C4
	.thumb_func
sub_80142C4:
	push {lr}
	sub sp, #4
	movs r0, #2
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

