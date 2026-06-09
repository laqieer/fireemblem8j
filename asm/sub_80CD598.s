	.syntax unified
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.section .text.sub_80CD598, "ax", %progbits
@ sub_80CD598 @ JP 0x080CD598 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD598
	.thumb_func
sub_80CD598:
	push {lr}
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0

