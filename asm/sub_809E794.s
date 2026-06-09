	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DrawPrepScreenItemUseStatBars, 0x0809E37C + 1
	.set DrawPrepScreenItemUseStatValues, 0x0809E51C + 1
	.set InitText, 0x08003C8C + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetupFaceGfxData, 0x0800544C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_809AF64, 0x0809AF64 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_809E1D4, 0x0809E1D4 + 1
	.set sub_809E6B4, 0x0809E6B4 + 1
	.set sub_80B1460, 0x080B1460 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B261C, 0x080B261C + 1
	.set sub_80B269C, 0x080B269C + 1
	.section .text.sub_809E794, "ax", %progbits
@ sub_809E794 @ JP 0x0809E794 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809E794
	.thumb_func
sub_809E794:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _0809EA84 @ =0x081F5644
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r4, r6}
	stm r1!, {r4, r6}
	ldr r4, _0809EA88 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldr r0, _0809EA8C @ =0x08A93F34
	bl sub_8001ACC
	add r0, sp, #8
	bl SetupFaceGfxData
	movs r0, #0xff
	str r0, [r7, #0x34]
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
	ldrb r1, [r4, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetText
	bl sub_80034C4
	bl sub_804F8F4
	bl sub_801569C
	bl sub_80265CC
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
	ldr r0, _0809EA90 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808BB14
	movs r0, #4
	bl sub_8003508
	bl sub_8097CFC
	ldr r5, _0809EA94 @ =0x02013510
	movs r4, #4
_0809E866:
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809E866
	ldr r5, _0809EA98 @ =0x02013498
	movs r4, #7
_0809E87A:
	adds r0, r5, #0
	movs r1, #3
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809E87A
	ldr r0, _0809EA98 @ =0x02013498
	mov sl, r0
	adds r0, #0x40
	movs r1, #8
	bl InitText
	mov r0, sl
	adds r0, #0xc8
	movs r1, #0xf
	bl InitText
	mov r0, sl
	adds r0, #0xd0
	movs r1, #0xf
	bl InitText
	mov r0, sl
	adds r0, #0xd8
	movs r1, #0xc
	bl InitText
	mov r0, sl
	adds r0, #0xe0
	movs r1, #8
	bl InitText
	ldr r0, [r7, #0x2c]
	bl sub_809E1D4
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r7, #0x2c]
	bl sub_8018FCC
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _0809EA9C @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl sub_80063F8
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_809AF64
	ldr r0, _0809EAA0 @ =0x08A98550
	ldr r1, _0809EAA4 @ =0x06000440
	bl sub_8013008
	ldr r0, _0809EAA8 @ =0x08A9857C
	ldr r4, _0809EAAC @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0809EAB0 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80B261C
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl sub_80B269C
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r4, r0, #0
	bl sub_8003E0C
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _0809EAB4 @ =0x02022CA8
	movs r2, #0
	bl sub_8004374
	adds r0, r7, #0
	bl sub_80B1460
	adds r0, r7, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	ldr r0, _0809EAB8 @ =sub_809E764
	adds r1, r7, #0
	bl sub_80B1D98
	ldr r6, _0809EA88 @ =0x03003020
	ldrb r0, [r6, #1]
	movs r3, #0x20
	mov ip, r3
	mov r4, ip
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x66
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x8a
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r6
	mov sb, r0
	ldrb r1, [r0]
	movs r2, #1
	mov r8, r2
	mov r3, r8
	orrs r1, r3
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	ldr r6, _0809EABC @ =0x03003056
	ldrb r0, [r6]
	mov r6, r8
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, ip
	orrs r1, r2
	mov r3, sb
	strb r1, [r3]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	ldr r4, _0809EABC @ =0x03003056
	strb r0, [r4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	movs r6, #0
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	adds r0, r7, #0
	bl sub_80048B4
	movs r0, #0xc0
	movs r1, #0x8c
	movs r2, #9
	adds r3, r7, #0
	bl sub_808B750
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl sub_809E6B4
	mov r1, sl
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _0809EAC0 @ =0x02022EEC
	movs r3, #1
	bl sub_809DA14
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0xb
	movs r3, #0x80
	lsls r3, r3, #4
	bl sub_80B1FBC
	ldr r0, [r7, #0x2c]
	bl sub_80176AC
	bl sub_80267A0
	bl sub_8026F38
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EA84: .4byte 0x081F5644
_0809EA88: .4byte 0x03003020
_0809EA8C: .4byte 0x08A93F34
_0809EA90: .4byte 0x06014000
_0809EA94: .4byte 0x02013510
_0809EA98: .4byte 0x02013498
_0809EA9C: .4byte 0x00000203
_0809EAA0: .4byte 0x08A98550
_0809EAA4: .4byte 0x06000440
_0809EAA8: .4byte 0x08A9857C
_0809EAAC: .4byte 0x02020188
_0809EAB0: .4byte 0x020234A8
_0809EAB4: .4byte 0x02022CA8
_0809EAB8: .4byte 0x0809E765  @ sub_809E764
_0809EABC: .4byte 0x03003056
_0809EAC0: .4byte 0x02022EEC

