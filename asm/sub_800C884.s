	.syntax unified
	.set HideGmUnit, 0x080C4354 + 1
	.section .text.sub_800C884, "ax", %progbits
@ sub_800C884 @ JP 0x0800C884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C884
	.thumb_func
sub_800C884:
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	bl HideGmUnit
	movs r0, #0
	pop {r1}
	bx r1

