	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F4BC, "ax", %progbits
@ sub_806F4BC @ JP 0x0806F4BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F4BC
	.thumb_func
sub_806F4BC:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806F4D4
	adds r0, r1, #0
	bl sub_8002DE4
_0806F4D4:
	pop {r0}
	bx r0

