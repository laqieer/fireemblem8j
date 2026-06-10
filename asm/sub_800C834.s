	.syntax unified
	.set SetGmClassUnit, 0x080C42B4 + 1
	.section .text.sub_800C834, "ax", %progbits
@ sub_800C834 @ JP 0x0800C834 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C834
	.thumb_func
sub_800C834:
	push {lr}
	ldr r3, [r0, #0x38]
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrh r3, [r3, #0xa]
	bl SetGmClassUnit
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

