	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B9310, 0x080B9310 + 1
	.set sub_80B9C50, 0x080B9C50 + 1
	.section .text.sub_80B9CD0, "ax", %progbits
@ sub_80B9CD0 @ JP 0x080B9CD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9CD0
	.thumb_func
sub_80B9CD0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	bl sub_80B9310
	ldr r0, [r4, #0x54]
	bl sub_80B9C50
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

