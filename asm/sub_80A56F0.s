	.syntax unified
	.set sub_80A69D4, 0x080A69D4 + 1
	.section .text.sub_80A56F0, "ax", %progbits
@ sub_80A56F0 @ JP 0x080A56F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A56F0
	.thumb_func
sub_80A56F0:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl sub_80A69D4
	pop {r0}
	bx r0
	.align 2, 0

