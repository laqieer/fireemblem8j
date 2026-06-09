	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_809C84C, 0x0809C84C + 1
	.set sub_809CAE0, 0x0809CAE0 + 1
	.set sub_809CB40, 0x0809CB40 + 1
	.set sub_809CBC4, 0x0809CBC4 + 1
	.set sub_809CBFC, 0x0809CBFC + 1
	.set sub_809CCC4, 0x0809CCC4 + 1
	.set sub_809CDBC, 0x0809CDBC + 1
	.set sub_809D090, 0x0809D090 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809D144, "ax", %progbits
@ sub_809D144 @ JP 0x0809D144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D144
	.thumb_func
sub_809D144:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0809D2C0 @ =0x08A93F34
	bl sub_8001ACC
	ldr r4, _0809D2C4 @ =0x03003020
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
	adds r0, r5, #0
	bl sub_809D090
	ldr r0, _0809D2C8 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0809D2CC @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0809D2D0 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_809CAE0
	bl sub_809CB40
	movs r0, #7
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl sub_809CBC4
	ldr r0, _0809D2D4 @ =sub_809C938
	adds r1, r5, #0
	bl sub_80B1D98
	adds r0, r5, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80B1FBC
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xe0
	movs r2, #0x20
	bl StartMenuScrollBarExt
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	movs r0, #0x20
	movs r1, #0x8f
	movs r2, #9
	adds r3, r5, #0
	bl sub_808B750
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809CCC4
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809CBFC
	movs r4, #0
_0809D28C:
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl sub_809C84C
	adds r4, #1
	cmp r4, #5
	ble _0809D28C
	adds r0, r5, #0
	movs r1, #0
	bl sub_809CDBC
	adds r0, r5, #0
	bl sub_80048B4
	ldr r0, _0809D2D8 @ =0x06014800
	movs r1, #5
	bl sub_808BB14
	bl sub_8097CFC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2C0: .4byte 0x08A93F34
_0809D2C4: .4byte 0x03003020
_0809D2C8: .4byte 0x02022CA8
_0809D2CC: .4byte 0x020234A8
_0809D2D0: .4byte 0x02023CA8
_0809D2D4: .4byte 0x0809C939  @ sub_809C938
_0809D2D8: .4byte 0x06014800

