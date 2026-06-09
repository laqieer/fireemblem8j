	.syntax unified
	.set sub_80B3B84, 0x080B3B84 + 1
	.section .text.sub_80B4960, "ax", %progbits
@ sub_80B4960 @ JP 0x080B4960 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4960
	.thumb_func
sub_80B4960:
	push {lr}
	adds r2, r0, #0
	adds r2, #0x3a
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	bl sub_80B3B84
	pop {r0}
	bx r0

