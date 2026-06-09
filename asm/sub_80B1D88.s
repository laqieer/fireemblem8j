	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80B1D88, "ax", %progbits
@ sub_80B1D88 @ JP 0x080B1D88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1D88
	.thumb_func
sub_80B1D88:
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x2c]
	adds r0, r1, #0
	bl sub_80D65C4
	pop {r0}
	bx r0

