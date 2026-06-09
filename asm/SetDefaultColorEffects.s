	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.SetDefaultColorEffects, "ax", %progbits
@ SetDefaultColorEffects @ JP 0x08001ED0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetDefaultColorEffects
	.thumb_func
SetDefaultColorEffects:
	push {lr}
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0

