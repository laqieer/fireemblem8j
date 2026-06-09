	.syntax unified
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.section .text.sub_801D360, "ax", %progbits
@ sub_801D360 @ JP 0x0801D360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D360
	.thumb_func
sub_801D360:
	push {lr}
	bl sub_80310F4
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0

