	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C96D0, 0x080C96D0 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C9DD4, "ax", %progbits
@ sub_80C9DD4 @ JP 0x080C9DD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9DD4
	.thumb_func
sub_80C9DD4:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C9E1C
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x50
	movs r2, #0
	bl _DivArm1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	subs r1, r0, r1
	lsls r1, r1, #4
	bl sub_80D6378
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	b _080C9E46
_080C9E1C:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x50
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	adds r0, r4, #0
	bl sub_80C96D0
_080C9E46:
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_80C96D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

