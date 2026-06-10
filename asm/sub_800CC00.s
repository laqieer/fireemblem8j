	.syntax unified
	.set sub_80C52D8, 0x080C52D8 + 1
	.section .text.sub_800CC00, "ax", %progbits
@ sub_800CC00 @ JP 0x0800CC00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CC00
	.thumb_func
sub_800CC00:
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	movs r1, #0
	bl sub_80C52D8
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0

