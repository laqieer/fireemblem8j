	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_80C6BE8, "ax", %progbits
@ sub_80C6BE8 @ JP 0x080C6BE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6BE8
	.thumb_func
sub_80C6BE8:
	push {lr}
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #0x2e]
	ldrh r2, [r0, #0x30]
	movs r0, #1
	bl BG_SetPosition
	pop {r0}
	bx r0
	.align 2, 0

