	.syntax unified
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.section .text.sub_8056214, "ax", %progbits
@ sub_8056214 @ JP 0x08056214 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056214
	.thumb_func
sub_8056214:
	push {lr}
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0

