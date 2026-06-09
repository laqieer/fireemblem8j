	.syntax unified
	.set nullsub_95, 0x080BDE98 + 1
	.section .text.sub_80BED9C, "ax", %progbits
@ sub_80BED9C @ JP 0x080BED9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BED9C
	.thumb_func
sub_80BED9C:
	push {lr}
	bl nullsub_95
	pop {r0}
	bx r0
	.align 2, 0

