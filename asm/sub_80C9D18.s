	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C96D0, 0x080C96D0 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C9D18, "ax", %progbits
@ sub_80C9D18 @ JP 0x080C9D18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9D18
	.thumb_func
sub_80C9D18:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C9D5E
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	movs r1, #0x50
	movs r2, #0
	bl _DivArm1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
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
	b _080C9DBE
_080C9D5E:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r4, r5, #0
	adds r4, #0x29
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	bgt _080C9D9C
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r2, _080C9D98 @ =0x081F6C94
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r5, #0x2a]
	movs r0, #0
	strh r0, [r5, #0x2c]
	b _080C9DBE
	.align 2, 0
_080C9D98: .4byte 0x081F6C94
_080C9D9C:
	ldr r2, _080C9DD0 @ =0x081F6C94
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r5, #0x2a]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080C9DBE:
	bl sub_8001EE4
	adds r0, r5, #0
	bl sub_80C96D0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9DD0: .4byte 0x081F6C94

