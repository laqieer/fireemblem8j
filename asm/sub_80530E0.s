	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetSelectTargetCount, 0x08050AC8 + 1
	.set PlayDeathSoundForArena, 0x0805BE20 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set NewEfxDeadEvent, 0x08053AC4 + 1
	.set sub_8053C9C, 0x08053C9C + 1
	.set sub_80858E0, 0x080858E0 + 1
	.section .text.sub_80530E0, "ax", %progbits
@ sub_80530E0 @ JP 0x080530E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80530E0
	.thumb_func
sub_80530E0:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _08053184 @ =0x02000000
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _08053142
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08053142
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _08053188 @ =0x0203E1A8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _08053142
	movs r0, #1
	str r0, [r5, #0x58]
_08053142:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _080531E4
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _080531E4
	ldr r4, _0805318C @ =0x0203E14E
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _08053190 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _080531D8
	bl GetSelectTargetCount
	cmp r0, #1
	bne _08053194
	movs r0, #0
	b _080531A8
	.align 2, 0
_08053184: .4byte 0x02000000
_08053188: .4byte 0x0203E1A8
_0805318C: .4byte 0x0203E14E
_08053190: .4byte 0x02017780
_08053194:
	ldr r4, _080531B8 @ =0x0203E18C
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_80858E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080531A8:
	cmp r0, #1
	bne _080531BC
	adds r0, r6, #0
	adds r1, r7, #0
	bl NewEfxDeadEvent
	b _080531D8
	.align 2, 0
_080531B8: .4byte 0x0203E18C
_080531BC:
	bl PlayDeathSoundForArena
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8053C9C
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _080531E0 @ =0x0203E100
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_080531D8:
	adds r0, r5, #0
	bl sub_8002DE4
	b _080531F0
	.align 2, 0
_080531E0: .4byte 0x0203E100
_080531E4:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _080531F0
	movs r0, #0x1e
	str r0, [r5, #0x54]
_080531F0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

