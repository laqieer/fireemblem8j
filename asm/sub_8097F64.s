	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set InitText, 0x08003C8C + 1
	.set PrepAutoCapDeployUnits, 0x08097C94 + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set StartPrepScreenSpriteDraw, 0x08098EE0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8097304, 0x08097304 + 1
	.set sub_8097804, 0x08097804 + 1
	.set sub_80979B8, 0x080979B8 + 1
	.set sub_8097B9C, 0x08097B9C + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_8097D24, 0x08097D24 + 1
	.set sub_8097E44, 0x08097E44 + 1
	.set sub_8097E74, 0x08097E74 + 1
	.set sub_8097F30, 0x08097F30 + 1
	.set sub_80993F0, 0x080993F0 + 1
	.set sub_80B1C4C, 0x080B1C4C + 1
	.set sub_80B1C70, 0x080B1C70 + 1
	.section .text.sub_8097F64, "ax", %progbits
@ sub_8097F64 @ JP 0x08097F64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097F64
	.thumb_func
sub_8097F64:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, _080980E0 @ =0x08A93F34
	bl sub_8001ACC
	bl ResetText
	bl sub_804F8F4
	movs r0, #0
	movs r1, #0xe
	bl sub_808BB14
	ldr r2, _080980E4 @ =0x03003020
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
	bl sub_801569C
	bl ResetUnitSprites
	bl sub_8097B9C
	adds r0, r7, #0
	bl PrepAutoCapDeployUnits
	bl sub_80979B8
	ldr r0, _080980E8 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080980EC @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080980F0 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r5, _080980F4 @ =0x020111A4
	movs r4, #4
_08097FD2:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08097FD2
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldr r5, _080980F8 @ =0x02011184
	movs r4, #3
_08097FEC:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08097FEC
	ldr r0, _080980FC @ =0x0201117C
	movs r1, #0xa
	bl InitText
	ldr r0, _08098100 @ =0x08A96D18
	ldr r1, _08098104 @ =0x06014800
	bl sub_8013008
	ldr r0, _08098108 @ =0x08A99FE8
	ldr r1, _0809810C @ =0x06016000
	bl sub_8013008
	ldr r0, _08098110 @ =0x08A97BEC
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #6
	bl sub_8097F30
	ldr r0, _08098114 @ =0x08A99F60
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	ldr r3, _080980E4 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldrb r1, [r3, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
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
	adds r0, r7, #0
	bl sub_8097804
	movs r0, #0xf
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r7, #0
	bl StartPrepScreenSpriteDraw
	bl sub_8097CFC
	ldr r0, _08098118 @ =0x085E0DB4
	movs r1, #0x40
	movs r2, #0x60
	bl sub_8000D68
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098128
	ldr r0, _0809811C @ =0x08A98130
	ldr r4, _08098120 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _08098124 @ =0x020235EA
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	b _08098156
	.align 2, 0
_080980E0: .4byte 0x08A93F34
_080980E4: .4byte 0x03003020
_080980E8: .4byte 0x02022CA8
_080980EC: .4byte 0x020234A8
_080980F0: .4byte 0x02023CA8
_080980F4: .4byte 0x020111A4
_080980F8: .4byte 0x02011184
_080980FC: .4byte 0x0201117C
_08098100: .4byte 0x08A96D18
_08098104: .4byte 0x06014800
_08098108: .4byte 0x08A99FE8
_0809810C: .4byte 0x06016000
_08098110: .4byte 0x08A97BEC
_08098114: .4byte 0x08A99F60
_08098118: .4byte 0x085E0DB4
_0809811C: .4byte 0x08A98130
_08098120: .4byte 0x02020188
_08098124: .4byte 0x020235EA
_08098128:
	ldr r0, _0809818C @ =0x08A980F0
	ldr r5, _08098190 @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	ldr r4, _08098194 @ =0x02023548
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	ldr r0, _08098198 @ =0x08A98130
	adds r1, r5, #0
	bl sub_8013008
	adds r4, #0xe2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
_08098156:
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #0xb
	bl sub_8097D24
	adds r0, r7, #0
	bl sub_80B1C4C
	movs r0, #0xd0
	lsls r0, r0, #7
	bl sub_80B1C70
	bl sub_80993F0
	mov r1, r8
	strb r0, [r1]
	bl sub_8097304
	bl sub_8097E44
	bl sub_8097E74
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809818C: .4byte 0x08A980F0
_08098190: .4byte 0x02020188
_08098194: .4byte 0x02023548
_08098198: .4byte 0x08A98130

