	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8079AA8, "ax", %progbits
@ sub_8079AA8 @ JP 0x08079AA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079AA8
	.thumb_func
sub_8079AA8:
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
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08079ACE
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl sub_8002DE4
_08079ACE:
	pop {r0}
	bx r0
	.align 2, 0

