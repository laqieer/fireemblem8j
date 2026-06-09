	.syntax unified
	.set sub_80BBEE8, 0x080BBEE8 + 1
	.section .text.sub_80BB740, "ax", %progbits
@ sub_80BB740 @ JP 0x080BB740 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB740
	.thumb_func
sub_80BB740:
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80BBEE8
	pop {r0}
	bx r0
	.align 2, 0

