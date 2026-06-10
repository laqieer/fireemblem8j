	.syntax unified
	.set sub_8030728, 0x08030728 + 1
	.set sub_80307B8, 0x080307B8 + 1
	.section .text.WfxFlames_Init, "ax", %progbits
@ WfxFlames_Init @ JP 0x0803081C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxFlames_Init
	.thumb_func
WfxFlames_Init:
	push {lr}
	bl sub_8030728
	bl sub_80307B8
	pop {r0}
	bx r0
	.align 2, 0

