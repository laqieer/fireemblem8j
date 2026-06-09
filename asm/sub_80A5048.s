	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set InitText, 0x08003C8C + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set UnlockMenuScrollBar, 0x0809994C + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_804F908, 0x0804F908 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_80A487C, 0x080A487C + 1
	.set sub_80A4CA8, 0x080A4CA8 + 1
	.set sub_80A4DD0, 0x080A4DD0 + 1
	.set sub_80A4F18, 0x080A4F18 + 1
	.set sub_80A4FB8, 0x080A4FB8 + 1
	.set sub_80A5774, 0x080A5774 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A5048, "ax", %progbits
@ sub_80A5048 @ JP 0x080A5048 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5048
	.thumb_func
sub_80A5048:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r7, _080A52A8 @ =0x03003020
	ldrb r1, [r7]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl sub_8001ACC
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
	ldrb r2, [r7, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r0, #1
	mov sb, r0
	mov r0, sb
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	orrs r0, r2
	strb r0, [r7, #0x18]
	bl ResetFaces
	bl ResetText
	bl sub_80034C4
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_804F908
	bl sub_801569C
	movs r0, #0xe
	bl sub_8003508
	adds r0, r6, #0
	bl sub_80A4FB8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #2
	bl BG_SetPosition
	ldr r1, _080A52AC @ =0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	movs r5, #0
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	bl sub_80265CC
	bl ResetUnitSprites
	adds r0, r6, #0
	bl sub_80A4CA8
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	ldr r0, _080A52B0 @ =0x08A9AA9C
	ldr r4, _080A52B4 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080A52B8 @ =0x020235AA
	movs r2, #0x90
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080A52BC @ =0x08A972B0
	ldr r1, _080A52C0 @ =0x06013800
	bl sub_8013008
	ldr r0, _080A52C4 @ =0x08A97C0C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrb r0, [r7, #1]
	movs r1, #0x20
	mov ip, r1
	mov r2, ip
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x26
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x86
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r8, r0
	ldrb r1, [r0]
	mov r2, sb
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, r7, #0
	adds r5, #0x36
	ldrb r0, [r5]
	mov r7, sb
	orrs r0, r7
	orrs r0, r2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, ip
	orrs r1, r2
	mov r7, r8
	strb r1, [r7]
	orrs r0, r2
	strb r0, [r5]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	ldr r5, _080A52C8 @ =0x02013498
	movs r4, #0x14
_080A51E2:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080A51E2
	bl sub_80A4DD0
	bl sub_80A487C
	cmp r0, #0
	beq _080A524E
	adds r0, r6, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A522E
	adds r1, #0xf
_080A522E:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl sub_80B1FBC
	movs r0, #0xc0
	movs r1, #1
	movs r2, #9
	adds r3, r6, #0
	bl sub_808B750
_080A524E:
	movs r0, #0x88
	movs r1, #9
	movs r2, #0xb
	adds r3, r6, #0
	bl sub_80A4F18
	ldr r0, _080A52CC @ =sub_80A4F4C
	adds r1, r6, #0
	bl sub_80B1D98
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #4
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd8
	movs r2, #0x2d
	bl StartMenuScrollBarExt
	ldrh r4, [r6, #0x34]
	bl sub_80A487C
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	bl UnlockMenuScrollBar
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A52A0
	adds r1, #0xf
_080A52A0:
	asrs r4, r1, #4
	adds r5, r6, #0
	adds r5, #0x43
	b _080A52DA
	.align 2, 0
_080A52A8: .4byte 0x03003020
_080A52AC: .4byte 0x0000FFD8
_080A52B0: .4byte 0x08A9AA9C
_080A52B4: .4byte 0x02020188
_080A52B8: .4byte 0x020235AA
_080A52BC: .4byte 0x08A972B0
_080A52C0: .4byte 0x06013800
_080A52C4: .4byte 0x08A97C0C
_080A52C8: .4byte 0x02013498
_080A52CC: .4byte 0x080A4F4D  @ sub_80A4F4C
_080A52D0:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A5774
	adds r4, #1
_080A52DA:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A52E2
	adds r0, #0xf
_080A52E2:
	asrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	blt _080A52D0
	adds r0, r6, #0
	bl sub_80048B4
	movs r0, #0
	strb r0, [r5]
	ldr r0, _080A5324 @ =0x06014800
	movs r1, #0xa
	bl sub_808BB14
	ldr r2, _080A5328 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5324: .4byte 0x06014800
_080A5328: .4byte 0x03003020

