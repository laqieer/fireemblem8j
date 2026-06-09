	.syntax unified
	.set WfxFlamesUpdateParticles, 0x08030898 + 1
	.set sub_803082C, 0x0803082C + 1
	.section .text.WfxFlames_VSync, "ax", %progbits
@ WfxFlames_VSync @ JP 0x08030930 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxFlames_VSync
	.thumb_func
WfxFlames_VSync:
	push {lr}
	bl sub_803082C
	bl WfxFlamesUpdateParticles
	pop {r0}
	bx r0
	.align 2, 0

