	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set DisableEfxStatusUnits, 0x0805583C + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetAnimStateHidden, 0x0805B0FC + 1
	.set SetAnimStateUnHidden, 0x0805B138 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_8054E1C, 0x08054E1C + 1
	.set sub_80554C4, 0x080554C4 + 1
	.set sub_805C1A4, 0x0805C1A4 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_80752B4, 0x080752B4 + 1
	.set sub_80752F8, 0x080752F8 + 1
	.set sub_80753B4, 0x080753B4 + 1
	.set sub_8075460, 0x08075460 + 1
	.set sub_80754C4, 0x080754C4 + 1
	.set sub_8075528, 0x08075528 + 1
	.set sub_80755A0, 0x080755A0 + 1
	.set sub_80756FC, 0x080756FC + 1
	.set sub_8075864, 0x08075864 + 1
	.section .text.sub_8074F20, "ax", %progbits
@ sub_8074F20 @ JP 0x08074F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074F20
	.thumb_func
sub_8074F20:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08074F9C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, [r4, #0x5c]
	bl DisableEfxStatusUnits
	adds r0, r5, #0
	bl DisableEfxStatusUnits
	ldr r2, _08074F98 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, [r4, #0x5c]
	bl sub_8075460
	adds r0, r5, #0
	bl sub_80753B4
	b _08075170
	.align 2, 0
_08074F98: .4byte 0x03003020
_08074F9C:
	cmp r0, #0x28
	bne _08074FA8
	adds r0, r5, #0
	bl sub_80752B4
	b _08075170
_08074FA8:
	cmp r0, #0x87
	bne _08074FBE
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0x10
	bl sub_805C7CC
	b _08075170
_08074FBE:
	cmp r0, #0x88
	bne _08074FCE
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #0
	bl sub_8075864
	b _08075170
_08074FCE:
	cmp r0, #0x94
	bne _08074FDA
	movs r0, #1
	bl SetAnimStateHidden
	b _08075170
_08074FDA:
	cmp r0, #0x8c
	bne _08074FF2
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_8054BF8
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl BG_SetPosition
	b _08075170
_08074FF2:
	cmp r0, #0x92
	bne _08075000
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8075528
	b _08075170
_08075000:
	cmp r0, #0xba
	bne _08075024
	ldr r2, [r4, #0x5c]
	ldrh r1, [r2, #8]
	ldr r0, _08075020 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	ldr r2, [r4, #0x5c]
	ldrh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	b _08075170
	.align 2, 0
_08075020: .4byte 0x0000F3FF
_08075024:
	cmp r0, #0xd8
	bne _08075030
	adds r0, r5, #0
	bl sub_80754C4
	b _08075170
_08075030:
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r0, r6
	bne _080750A0
	ldr r0, [r4, #0x5c]
	bl sub_80752F8
	ldr r2, _0807509C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #0x10
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0
	bl sub_805C7CC
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	b _08075170
	.align 2, 0
_0807509C: .4byte 0x03003020
_080750A0:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r0, #0x8f
	lsls r0, r0, #1
	cmp r1, r0
	bne _080750C8
	movs r0, #0
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl sub_8054BF8
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl sub_80554C4
	b _08075170
_080750C8:
	movs r0, #0x9d
	lsls r0, r0, #1
	cmp r1, r0
	bne _080750F4
	ldrh r0, [r5, #8]
	ldr r1, _080750F0 @ =0x0000F3FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r5, #8]
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x46
	bl sub_8054E1C
	b _08075170
	.align 2, 0
_080750F0: .4byte 0x0000F3FF
_080750F4:
	movs r0, #0xa2
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075150
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_80755A0
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_80756FC
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x5a
	movs r2, #0x28
	movs r3, #0xe
	bl sub_805C7CC
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0xa
	adds r3, r6, #0
	bl sub_805C1A4
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0
	bl NewEfxRestWINH_
	ldr r0, _0807514C @ =0x0000013D
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r6, #0
	movs r3, #1
	bl sub_8074E80
	b _08075170
	.align 2, 0
_0807514C: .4byte 0x0000013D
_08075150:
	movs r0, #0xa6
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075162
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_8075528
	b _08075170
_08075162:
	movs r0, #0x8f
	lsls r0, r0, #2
	cmp r1, r0
	bne _08075170
	adds r0, r4, #0
	bl sub_8002DE4
_08075170:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	ldrh r2, [r4, #0x2c]
	cmp r1, #0x28
	bne _0807518A
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08075270
_0807518A:
	cmp r1, #0x52
	bne _0807519E
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08075270
_0807519E:
	cmp r1, #0x68
	bne _080751B2
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08075270
_080751B2:
	cmp r1, #0x72
	bne _080751C6
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08075270
_080751C6:
	cmp r1, #0x74
	bne _080751DA
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08075270
_080751DA:
	cmp r1, #0x76
	bne _080751EE
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08075270
_080751EE:
	cmp r1, #0x78
	bne _08075204
	ldr r0, _08075200 @ =0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08075270
	.align 2, 0
_08075200: .4byte 0x0000013B
_08075204:
	movs r3, #0x80
	lsls r3, r3, #1
	cmp r1, r3
	bne _08075214
	ldr r0, _08075210 @ =0x000003E5
	b _08075268
	.align 2, 0
_08075210: .4byte 0x000003E5
_08075214:
	movs r0, #0x8f
	lsls r0, r0, #1
	cmp r1, r0
	beq _08075264
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075228
	adds r0, #0x1e
	b _08075268
_08075228:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x91
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075238
	adds r0, #0x1c
	b _08075268
_08075238:
	movs r0, #0x93
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075244
	adds r0, #0x18
	b _08075268
_08075244:
	movs r0, #0x95
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075250
	adds r0, #0x14
	b _08075268
_08075250:
	movs r0, #0x97
	lsls r0, r0, #1
	cmp r1, r0
	bne _0807525C
	adds r0, #0x10
	b _08075268
_0807525C:
	movs r0, #0x99
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075278
_08075264:
	movs r0, #0x9f
	lsls r0, r0, #1
_08075268:
	ldr r1, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r1, r4]
	adds r1, r3, #0
_08075270:
	movs r3, #1
	bl sub_8074E80
	b _08075290
_08075278:
	movs r0, #0x9a
	lsls r0, r0, #1
	cmp r1, r0
	bne _08075290
	ldr r0, _08075298 @ =0x000003E6
	ldr r1, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r1, r4]
	adds r1, r3, #0
	movs r3, #1
	bl sub_8074E80
_08075290:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075298: .4byte 0x000003E6

