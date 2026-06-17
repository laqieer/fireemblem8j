	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetSelectTargetCount, 0x08050AC8 + 1
	.set PlayDeathSoundForArena, 0x0805BE20 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8053AC4, 0x08053AC4 + 1
	.set sub_8053C9C, 0x08053C9C + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_80858E0, 0x080858E0 + 1
	.section .text.sub_805351C, "ax", %progbits
@ sub_805351C @ JP 0x0805351C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805351C
	.thumb_func
sub_805351C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _080535F0 @ =0x02000000
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
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
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _080535AC
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080535AC
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _080535F4 @ =0x0203E1A8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r0, #0x75
	movs r2, #1
	bl sub_8073F94
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _080535AC
	movs r0, #1
	str r0, [r5, #0x58]
_080535AC:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _08053650
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _08053650
	ldr r4, _080535F8 @ =0x0203E14E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _080535FC @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08053644
	bl GetSelectTargetCount
	cmp r0, #1
	bne _08053600
	movs r0, #0
	b _08053614
	.align 2, 0
_080535F0: .4byte 0x02000000
_080535F4: .4byte 0x0203E1A8
_080535F8: .4byte 0x0203E14E
_080535FC: .4byte 0x02017780
_08053600:
	ldr r4, _08053624 @ =0x0203E18C
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_80858E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08053614:
	cmp r0, #1
	bne _08053628
	adds r0, r6, #0
	mov r1, r8
	bl sub_8053AC4
	b _08053644
	.align 2, 0
_08053624: .4byte 0x0203E18C
_08053628:
	bl PlayDeathSoundForArena
	adds r0, r6, #0
	mov r1, r8
	bl sub_8053C9C
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0805364C @ =0x0203E100
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_08053644:
	adds r0, r5, #0
	bl sub_8002DE4
	b _0805365C
	.align 2, 0
_0805364C: .4byte 0x0203E100
_08053650:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0805365C
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0805365C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

