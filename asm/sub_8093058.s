	.syntax unified
	.set ApplyPrepWindowColorPalette, 0x0809A2B4 + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set InitText, 0x08003C8C + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set StartMuralBackground, 0x08088E74 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_800125C, 0x0800125C + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8092518, 0x08092518 + 1
	.set sub_80926F8, 0x080926F8 + 1
	.set sub_8092FD8, 0x08092FD8 + 1
	.set sub_8094590, 0x08094590 + 1
	.set sub_80945E8, 0x080945E8 + 1
	.set sub_8094ED0, 0x08094ED0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8093058, "ax", %progbits
@ UnitList_SetupDisplay @ JP 0x08093058 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitList_SetupDisplay
	.thumb_func
UnitList_SetupDisplay:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	ldr r2, _08093138 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r6, #1
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl sub_800125C
	movs r0, #0
	bl sub_8001ACC
	bl ResetText
	bl ResetTextFont
	bl sub_80034D0
	bl sub_80265CC
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _0809313C @ =0x02022C08
	ldr r2, _08093140 @ =0x01000008
	add r0, sp, #4
	bl sub_80D636C
	bl sub_801569C
	mov r0, r8
	bl sub_80048B4
	mov r0, r8
	adds r0, #0x3b
	strb r4, [r0]
	subs r0, #0xd
	movs r5, #6
	strb r5, [r0]
	mov r0, r8
	bl sub_8092FD8
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _080930EC
	mov r0, r8
	adds r0, #0x2a
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x32
	str r1, [sp, #0x14]
	mov r2, r8
	adds r2, #0x29
	str r2, [sp, #8]
	movs r1, #0x2f
	add r1, r8
	mov sl, r1
	cmp r0, #1
	bne _08093160
_080930EC:
	ldr r4, _08093144 @ =0x0202BCEC
	ldrb r1, [r4, #0x1a]
	mov r3, r8
	adds r3, #0x34
	mov r2, r8
	adds r2, #0x32
	str r2, [sp, #0x14]
	cmp r1, #0
	beq _08093110
	lsrs r0, r1, #7
	ands r0, r6
	adds r2, #1
	strb r0, [r2]
	strb r0, [r3]
	movs r0, #0x7f
	ands r1, r0
	ldr r0, [sp, #0x14]
	strb r1, [r0]
_08093110:
	mov r0, r8
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #8]
	movs r2, #0x2f
	add r2, r8
	mov sl, r2
	cmp r1, #4
	beq _08093156
	ldrb r0, [r2]
	cmp r0, #0
	beq _08093156
	ldrb r0, [r4, #0x19]
	lsrs r1, r0, #4
	cmp r1, #0
	beq _08093156
	cmp r1, #6
	bls _08093148
	strb r5, [r2]
	b _0809314C
	.align 2, 0
_08093138: .4byte 0x03003020
_0809313C: .4byte 0x02022C08
_08093140: .4byte 0x01000008
_08093144: .4byte 0x0202BCEC
_08093148:
	mov r0, sl
	strb r1, [r0]
_0809314C:
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	adds r1, #0x36
	strb r0, [r1]
_08093156:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl sub_8094ED0
_08093160:
	ldr r0, _08093248 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r4, _0809324C @ =0x020234A8
	adds r0, r4, #0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08093250 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	bl sub_80034C4
	movs r0, #4
	bl sub_8003508
	bl sub_804F8F4
	ldr r0, _08093254 @ =0x08A99800
	ldr r1, _08093258 @ =0x06014800
	bl sub_8013008
	mov r1, sl
	ldrb r0, [r1]
	ldr r2, _0809325C @ =0x08A99D20
	cmp r0, #0
	beq _0809319C
	ldr r2, _08093260 @ =0x08A9985C
_0809319C:
	ldr r1, _08093264 @ =0x06015800
	adds r0, r2, #0
	bl sub_8013008
	ldr r0, _08093268 @ =0x08A97BEC
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	bl ApplyPrepWindowColorPalette
	ldr r1, _0809326C @ =0x08A9934C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl j_TmApplyTsa
	movs r4, #0
	mov r2, r8
	adds r2, #0x2e
	str r2, [sp, #0x10]
	mov r0, r8
	adds r0, #0x2b
	str r0, [sp, #0xc]
	ldr r6, _08093270 @ =0x0200E098
	movs r1, #0x10
	adds r1, r1, r6
	mov sb, r1
	adds r5, r6, #0
	movs r7, #0
_080931DA:
	lsls r0, r4, #3
	ldr r1, _08093274 @ =0x0200E060
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	adds r0, r5, #0
	movs r1, #8
	bl InitTextDb
	adds r0, r6, #0
	adds r0, #8
	adds r0, r7, r0
	movs r1, #7
	bl InitText
	mov r0, sb
	movs r1, #5
	bl InitText
	movs r2, #0x18
	add sb, r2
	adds r5, #0x18
	adds r7, #0x18
	adds r4, #1
	cmp r4, #6
	ble _080931DA
	ldr r0, _08093278 @ =0x0200E140
	movs r1, #4
	bl InitText
	ldr r0, _0809327C @ =0x0200E148
	movs r1, #0x14
	bl InitText
	ldr r0, _08093280 @ =0x0200E150
	movs r1, #8
	bl InitText
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	bl sub_8092518
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	cmp r0, #4
	bne _08093284
	mov r0, r8
	movs r1, #0
	bl sub_80926F8
	movs r0, #0
	ldr r1, [sp, #8]
	strb r0, [r1]
	b _08093296
	.align 2, 0
_08093248: .4byte 0x02022CA8
_0809324C: .4byte 0x020234A8
_08093250: .4byte 0x02023CA8
_08093254: .4byte 0x08A99800
_08093258: .4byte 0x06014800
_0809325C: .4byte 0x08A99D20
_08093260: .4byte 0x08A9985C
_08093264: .4byte 0x06015800
_08093268: .4byte 0x08A97BEC
_0809326C: .4byte 0x08A9934C
_08093270: .4byte 0x0200E098
_08093274: .4byte 0x0200E060
_08093278: .4byte 0x0200E140
_0809327C: .4byte 0x0200E148
_08093280: .4byte 0x0200E150
_08093284:
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08093296
	mov r0, r8
	movs r1, #1
	bl sub_80926F8
_08093296:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x3c]
	ldr r0, [sp, #0xc]
	strb r1, [r0]
	ldr r4, _080932EC @ =0x0200E140
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #4
	bl sub_8003D84
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	ldr r0, _080932F0 @ =0x00000474
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, _080932F4 @ =0x02023DEE
	adds r0, r4, #0
	bl PutText
	ldr r1, _080932F8 @ =0x0200F15C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_080932D8:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _080932D8
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0809331A
	.align 2, 0
_080932EC: .4byte 0x0200E140
_080932F0: .4byte 0x00000474
_080932F4: .4byte 0x02023DEE
_080932F8: .4byte 0x0200F15C
_080932FC:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	ldr r2, _0809343C @ =0x02022CA8
	bl sub_80945E8
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_0809331A:
	cmp r4, r0
	bge _08093326
	ldr r0, _08093440 @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _080932FC
_08093326:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #1
	bl sub_8094590
	ldr r7, _08093444 @ =0x03003020
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r5, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	movs r6, #1
	orrs r0, r6
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0x36
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r5
	mov r1, sb
	strb r0, [r1]
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	mov r0, r8
	ldrh r2, [r0, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrb r2, [r7, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r2, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldr r0, _08093448 @ =0x08A99270
	ldr r1, _0809344C @ =0x020239A8
	bl sub_8013008
	ldr r0, _08093450 @ =0x08A968D4
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08093454 @ =0x08A93854
	mov r1, r8
	bl sub_8002BCC
	mov r1, r8
	str r0, [r1, #0x40]
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackground
	mov r2, r8
	str r0, [r2, #0x44]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_808BB14
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809343C: .4byte 0x02022CA8
_08093440: .4byte 0x0200F158
_08093444: .4byte 0x03003020
_08093448: .4byte 0x08A99270
_0809344C: .4byte 0x020239A8
_08093450: .4byte 0x08A968D4
_08093454: .4byte 0x08A93854

