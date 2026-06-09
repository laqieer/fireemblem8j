	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set _DivArm2, 0x0800BB3C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C73B0, "ax", %progbits
@ sub_80C73B0 @ JP 0x080C73B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C73B0
	.thumb_func
sub_80C73B0:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bgt _080C73F4
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	movs r1, #0x2d
	movs r2, #0
	bl _DivArm2
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	lsls r1, r1, #4
	bl sub_80D6378
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	b _080C740A
_080C73F4:
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
_080C740A:
	pop {r4}
	pop {r0}
	bx r0

