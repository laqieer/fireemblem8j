	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set InitText, 0x08003C8C + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set SetupFaceGfxData, 0x0800544C + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set UnitGetIndexInPrepList, 0x08097BDC + 1
	.set UnlockMenuScrollBar, 0x0809994C + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8003A70, 0x08003A70 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8097674, 0x08097674 + 1
	.set sub_8097B9C, 0x08097B9C + 1
	.set sub_8097C08, 0x08097C08 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_809A780, 0x0809A780 + 1
	.set sub_809A82C, 0x0809A82C + 1
	.set sub_809C178, 0x0809C178 + 1
	.set sub_80B1460, 0x080B1460 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B14EC, 0x080B14EC + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_809A8F8, "ax", %progbits
@ PrepItemScreen_SetupGfx @ JP 0x0809A8F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItemScreen_SetupGfx
	.thumb_func
PrepItemScreen_SetupGfx:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, _0809AC48 @ =0x081F55EC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0809AC4C @ =0x08A93F34
	bl sub_8001ACC
	ldr r4, _0809AC50 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #4
	bl SetupFaceGfxData
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	ldr r0, _0809AC54 @ =0x06017800
	movs r1, #0
	bl sub_8003A70
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetText
	bl sub_80034C4
	movs r0, #4
	bl sub_8003508
	bl sub_804F8F4
	ldr r0, _0809AC58 @ =0x085E0DF4
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	bl sub_801569C
	bl sub_8097B9C
	bl sub_8097674
	bl UnitGetIndexInPrepList
	adds r1, r7, #0
	adds r1, #0x2a
	movs r4, #0
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_80B1F1C
	ldr r0, _0809AC5C @ =sub_809C544
	adds r1, r7, #0
	bl sub_80B1D98
	adds r0, r7, #0
	bl sub_80B1460
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0809AC60 @ =0x020228A8
	strh r4, [r0]
	bl sub_8001EE4
	add r4, sp, #0x24
	mov sl, r4
	ldr r5, _0809AC64 @ =0x02013498
	movs r4, #0xe
_0809A9FE:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A9FE
	movs r0, #0x2b
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _0809AC68 @ =0x02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_0809AA1E:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r0, r6, #0
	movs r1, #7
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809AA1E
	ldr r4, _0809AC6C @ =0x02013560
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #8
	bl InitText
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #5
	bl InitText
	ldr r0, _0809AC70 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808BB14
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r2, sb
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r3, _0809AC50 @ =0x03003020
	movs r4, #0x36
	adds r4, r4, r3
	mov ip, r4
	ldrb r2, [r4]
	movs r1, #0x20
	orrs r2, r1
	ldrb r0, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2d
	mov r1, sb
	strb r1, [r0]
	adds r0, #4
	movs r4, #4
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r6, r3, #0
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6]
	orrs r2, r5
	orrs r2, r3
	movs r0, #5
	rsbs r0, r0, #0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, _0809AC74 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	ldr r1, _0809AC78 @ =0x0000FFD8
	ldrh r2, [r7, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	movs r0, #7
	bl BG_EnableSyncByMask
	bl sub_80265CC
	mov r4, sb
	str r4, [sp, #0x24]
	ldr r1, _0809AC7C @ =0x02022C08
	ldr r2, _0809AC80 @ =0x01000008
	mov r0, sl
	bl sub_80D636C
	bl sub_8026F38
	ldr r0, _0809AC84 @ =0x08A99F80
	ldr r1, _0809AC88 @ =0x06013E00
	bl sub_8013008
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl sub_80B14EC
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	bl sub_8097CFC
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0809ABBA
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r7, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80B1474
	mov r2, r8
	ldrb r0, [r2]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809AC8C @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_809C178
_0809ABBA:
	movs r3, #0x80
	lsls r3, r3, #2
	movs r4, #4
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0xe0
	movs r2, #0xb
	bl StartMenuScrollBarExt
	ldrh r4, [r7, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	bl UnlockMenuScrollBar
	bl sub_8097C08
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	mov r0, sb
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, sb
	str r1, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _0809AC90 @ =PrepItemScreen_OnHBlank
	bl SetPrimaryHBlankHandler
	movs r0, #0xa8
	movs r1, #0x85
	movs r2, #0xb
	adds r3, r7, #0
	bl sub_809A780
	adds r0, r7, #0
	bl sub_809A82C
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AC48: .4byte 0x081F55EC
_0809AC4C: .4byte 0x08A93F34
_0809AC50: .4byte 0x03003020
_0809AC54: .4byte 0x06017800
_0809AC58: .4byte 0x085E0DF4
_0809AC5C: .4byte 0x0809C545  @ sub_809C544
_0809AC60: .4byte 0x020228A8
_0809AC64: .4byte 0x02013498
_0809AC68: .4byte 0x02013510
_0809AC6C: .4byte 0x02013560
_0809AC70: .4byte 0x06014000
_0809AC74: .4byte 0x0000FFFC
_0809AC78: .4byte 0x0000FFD8
_0809AC7C: .4byte 0x02022C08
_0809AC80: .4byte 0x01000008
_0809AC84: .4byte 0x08A99F80
_0809AC88: .4byte 0x06013E00
_0809AC8C: .4byte 0x00000503
_0809AC90: .4byte 0x0809A6AD  @ PrepItemScreen_OnHBlank

