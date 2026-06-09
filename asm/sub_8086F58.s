	.syntax unified
	.set sub_8086F18, 0x08086F18 + 1
	.section .text.sub_8086F58, "ax", %progbits
@ sub_8086F58 @ JP 0x08086F58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086F58
	.thumb_func
sub_8086F58:
	push {lr}
	movs r0, #0
	bl sub_8086F18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

