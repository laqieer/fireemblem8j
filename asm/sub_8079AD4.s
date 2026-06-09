	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8079AD4, "ax", %progbits
@ sub_8079AD4 @ JP 0x08079AD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079AD4
	.thumb_func
sub_8079AD4:
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _08079AF8
	adds r0, r2, #0
	bl sub_8002DE4
_08079AF8:
	pop {r0}
	bx r0

