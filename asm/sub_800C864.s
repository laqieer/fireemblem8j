	.syntax unified
	.set RemoveGmUnit, 0x080C431C + 1
	.section .text.sub_800C864, "ax", %progbits
@ sub_800C864 @ JP 0x0800C864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C864
	.thumb_func
sub_800C864:
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	bl RemoveGmUnit
	movs r0, #0
	pop {r1}
	bx r1

