	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.sub_8089E2C, "ax", %progbits
@ sub_8089E2C @ JP 0x08089E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089E2C
	.thumb_func
sub_8089E2C:
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _08089E52
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _08089E64
	ldrh r0, [r2]
	adds r0, #1
	b _08089E62
_08089E52:
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08089E64
	movs r0, #0
_08089E62:
	strh r0, [r2]
_08089E64:
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0

