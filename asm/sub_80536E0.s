	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80536E0, "ax", %progbits
@ sub_80536E0 @ JP 0x080536E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80536E0
	.thumb_func
sub_80536E0:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _080536F8
	adds r0, r1, #0
	bl sub_8002DE4
_080536F8:
	pop {r0}
	bx r0

