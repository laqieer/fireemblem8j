	.syntax unified
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80211A0, "ax", %progbits
@ sub_80211A0 @ JP 0x080211A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80211A0
	.thumb_func
sub_80211A0:
	push {r4, lr}
	adds r4, r0, #0
	bl j_ColorFadeTick
	bl sub_8001EE4
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _080211C4
	adds r0, r4, #0
	bl sub_8002DE4
_080211C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

