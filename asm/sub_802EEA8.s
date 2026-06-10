	.syntax unified
	.set sub_8037864, 0x08037864 + 1
	.section .text.sub_802EEA8, "ax", %progbits
@ sub_802EEA8 @ JP 0x0802EEA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EEA8
	.thumb_func
sub_802EEA8:
	push {lr}
	bl sub_8037864
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

