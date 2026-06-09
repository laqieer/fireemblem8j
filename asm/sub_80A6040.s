	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SupportSubScreen_MakeDimmedObjPalette, 0x080A5FE8 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8005D9C, 0x08005D9C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_80A5C54, 0x080A5C54 + 1
	.set sub_80A5EC8, 0x080A5EC8 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B2034, 0x080B2034 + 1
	.section .text.sub_80A6040, "ax", %progbits
@ sub_80A6040 @ JP 0x080A6040 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6040
	.thumb_func
sub_80A6040:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080A61E4 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl sub_8001ACC
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r2
	strb r0, [r4, #0x18]
	bl ResetText
	bl sub_80034C4
	bl sub_804F8F4
	bl sub_801569C
	bl sub_80265CC
	bl SupportSubScreen_MakeDimmedObjPalette
	movs r0, #0xd
	bl sub_8003508
	adds r0, r5, #0
	bl sub_80048B4
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A610C
	ldr r2, _080A61E8 @ =0x0202BCEC
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	movs r0, #1
	bl sub_80B2034
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A610C
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80B1FBC
_080A610C:
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	bl sub_8097CFC
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	ldr r0, _080A61EC @ =0x08A9AB38
	ldr r4, _080A61F0 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080A61F4 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r4, _080A61F8 @ =0x088582BC
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r2, [r0, #6]
	ldr r1, _080A61FC @ =0x02022CEC
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	bl sub_8005D9C
	adds r0, r5, #0
	bl sub_80A5EC8
	adds r0, r5, #0
	bl sub_80A5C54
	ldr r0, _080A6200 @ =0x08A9AC28
	ldr r1, _080A6204 @ =0x06017800
	bl sub_8013008
	ldr r0, _080A6208 @ =0x08A9B004
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080A620C @ =0x08A99FA8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080A6210 @ =sub_80A5968
	adds r1, r5, #0
	bl sub_80B1D98
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A61E4: .4byte 0x03003020
_080A61E8: .4byte 0x0202BCEC
_080A61EC: .4byte 0x08A9AB38
_080A61F0: .4byte 0x02020188
_080A61F4: .4byte 0x020234A8
_080A61F8: .4byte 0x088582BC
_080A61FC: .4byte 0x02022CEC
_080A6200: .4byte 0x08A9AC28
_080A6204: .4byte 0x06017800
_080A6208: .4byte 0x08A9B004
_080A620C: .4byte 0x08A99FA8
_080A6210: .4byte 0x080A5969  @ sub_80A5968

