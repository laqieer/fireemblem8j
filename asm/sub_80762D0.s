	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80762D0, "ax", %progbits
@ sub_80762D0 @ JP 0x080762D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80762D0
	.thumb_func
sub_80762D0:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _08076306
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r4, #0x4c]
	subs r0, #2
	str r0, [r4, #0x50]
	ldr r0, _0807630C @ =0x020228A8
	ldr r1, _08076310 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	adds r0, r4, #0
	bl sub_8002DE4
_08076306:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807630C: .4byte 0x020228A8
_08076310: .4byte 0x020165C8

