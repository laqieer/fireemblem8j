	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8053AA8, "ax", %progbits
@ sub_8053AA8 @ JP 0x08053AA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053AA8
	.thumb_func
sub_8053AA8:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08053AC0
	adds r0, r1, #0
	bl sub_8002DE4
_08053AC0:
	pop {r0}
	bx r0

