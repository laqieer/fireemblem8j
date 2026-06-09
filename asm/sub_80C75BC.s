	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C7560, 0x080C7560 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C75BC, "ax", %progbits
@ sub_80C75BC @ JP 0x080C75BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C75BC
	.thumb_func
sub_80C75BC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x30]
	adds r0, #1
	strh r0, [r6, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bgt _080C7638
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	movs r1, #0x16
	movs r2, #2
	bl _DivArm1
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #5
	lsls r1, r4, #4
	adds r0, r5, #0
	bl sub_80D6378
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetBlendConfig
	subs r4, r5, r4
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r0, r5, #0
	bl sub_80D6378
	ldr r3, _080C7634 @ =0x081F67BC
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r3, #8
	ldrsh r2, [r1, r3]
	adds r2, r2, r0
	movs r0, #0xa
	ldrsh r3, [r1, r0]
	adds r0, r6, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #1
	bl sub_80C7560
	b _080C7672
	.align 2, 0
_080C7634: .4byte 0x081F67BC
_080C7638:
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	strh r0, [r6, #0x30]
	ldr r2, _080C7678 @ =0x081F67BC
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #8
	ldrsh r2, [r0, r1]
	movs r1, #0xa
	ldrsh r3, [r0, r1]
	adds r0, r6, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0
	bl sub_80C7560
	adds r0, r6, #0
	bl sub_8002DE4
_080C7672:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7678: .4byte 0x081F67BC

