	.syntax unified
	.set ShowGmUnit, 0x080C4338 + 1
	.section .text.sub_800C874, "ax", %progbits
@ sub_800C874 @ JP 0x0800C874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C874
	.thumb_func
sub_800C874:
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	bl ShowGmUnit
	movs r0, #0
	pop {r1}
	bx r1

