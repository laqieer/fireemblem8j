	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_8002330, 0x08002330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800D45C, 0x0800D45C + 1
	.set sub_80BD55C, 0x080BD55C + 1
	.set sub_80BD824, 0x080BD824 + 1
	.set sub_80C1120, 0x080C1120 + 1
	.set sub_80C4FE4, 0x080C4FE4 + 1
	.set sub_80C5628, 0x080C5628 + 1
	.set sub_80C6D14, 0x080C6D14 + 1
	.set sub_80C7218, 0x080C7218 + 1
	.set sub_80C8418, 0x080C8418 + 1
	.section .text.sub_80BEA40, "ax", %progbits
@ sub_80BEA40 @ JP 0x080BEA40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEA40
	.thumb_func
sub_80BEA40:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl sub_800D45C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BEB40
	ldr r0, [r6, #0x44]
	ldr r0, [r0, #0x4c]
	bl sub_80C1120
	ldr r0, _080BEAA0 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080BEAA4
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	b _080BEAC2
	.align 2, 0
_080BEAA0: .4byte 0x03005270
_080BEAA4:
	ldr r2, _080BEB04 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
_080BEAC2:
	bl sub_80BD824
	bl sub_80C8418
	bl sub_80BD55C
	bl sub_80C4FE4
	bl sub_80C7218
	bl sub_80C6D14
	ldr r5, _080BEB08 @ =0x03005270
	ldrb r1, [r5]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080BEB0C
	movs r0, #1
	bl sub_800226C
	movs r0, #1
	bl sub_8002330
	ldrb r0, [r5, #0x11]
	adds r2, r6, #0
	adds r2, #0x3e
	strb r0, [r2]
	adds r0, r6, #0
	movs r1, #0xf
	bl Proc_Goto
	b _080BEB40
	.align 2, 0
_080BEB04: .4byte 0x03003020
_080BEB08: .4byte 0x03005270
_080BEB0C:
	ldrb r1, [r5, #0x11]
	lsls r1, r1, #5
	ldr r0, _080BEB48 @ =0x081F5D7C
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	lsls r2, r0, #8
	str r2, [r5, #8]
	lsls r2, r1, #8
	str r2, [r5, #0xc]
	mov r4, sp
	adds r4, #6
	add r2, sp, #4
	adds r3, r4, #0
	bl sub_80C5628
	add r0, sp, #4
	ldrh r0, [r0]
	strh r0, [r5, #2]
	ldrh r0, [r4]
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl sub_8002DE4
_080BEB40:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BEB48: .4byte 0x081F5D7C

