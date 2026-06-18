	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_800407C, 0x0800407C + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8005890, 0x08005890 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8018FEC, 0x08018FEC + 1
	.set sub_80901D8, 0x080901D8 + 1
	.section .text.sub_8090474, "ax", %progbits
@ DrawChapterStatusTextForUnit @ JP 0x08090474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawChapterStatusTextForUnit
	.thumb_func
DrawChapterStatusTextForUnit:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _08090504 @ =0x02004BBC
	ldr r0, _08090508 @ =0x02022F1A
	movs r1, #3
	movs r2, #3
	movs r3, #0
	bl j_TmFillRect
	adds r0, r5, #0
	adds r0, #8
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl sub_80045BC
	cmp r6, #0
	bne _080904A4
	b _080905F0
_080904A4:
	ldr r0, [r6, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08090510
	adds r0, r5, #0
	movs r1, #2
	bl sub_8003D90
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_8003D84
	ldr r4, _0809050C @ =0x000004C5
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	adds r0, r5, #0
	movs r1, #0xa2
	bl sub_8003D84
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	adds r0, r5, #0
	movs r1, #0xba
	bl sub_8003D84
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	movs r0, #1
	bl sub_80901D8
	b _0809063C
	.align 2, 0
_08090504: .4byte 0x02004BBC
_08090508: .4byte 0x02022F1A
_0809050C: .4byte 0x000004C5
_08090510:
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D90
	ldr r0, [r6]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003D84
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8003F28
	adds r0, r5, #0
	movs r1, #2
	bl sub_8003D90
	adds r0, r5, #0
	movs r1, #0x8a
	bl sub_8003D84
	movs r1, #8
	ldrsb r1, [r6, r1]
	adds r0, r5, #0
	bl sub_800407C
	adds r0, r6, #0
	bl sub_8018E64
	cmp r0, #0x63
	ble _0809057C
	adds r0, r5, #0
	movs r1, #0xa2
	bl sub_8003D84
	ldr r0, _08090578 @ =0x000004C5
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	b _08090592
	.align 2, 0
_08090578: .4byte 0x000004C5
_0809057C:
	adds r0, r5, #0
	movs r1, #0xaa
	bl sub_8003D84
	adds r0, r6, #0
	bl sub_8018E64
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_800407C
_08090592:
	adds r0, r6, #0
	bl sub_8018EA4
	cmp r0, #0x63
	ble _080905B8
	adds r0, r5, #0
	movs r1, #0xba
	bl sub_8003D84
	ldr r0, _080905B4 @ =0x000004C5
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	b _080905CE
	.align 2, 0
_080905B4: .4byte 0x000004C5
_080905B8:
	adds r0, r5, #0
	movs r1, #0xc2
	bl sub_8003D84
	adds r0, r6, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_800407C
_080905CE:
	adds r0, r6, #0
	bl sub_8018FEC
	ldr r1, _080905EC @ =0x02022F1A
	movs r2, #0xa0
	lsls r2, r2, #2
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl sub_8005890
	movs r0, #0
	bl sub_80901D8
	b _0809063C
	.align 2, 0
_080905EC: .4byte 0x02022F1A
_080905F0:
	adds r0, r5, #0
	movs r1, #2
	bl sub_8003D90
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_8003D84
	ldr r4, _080906A0 @ =0x000004C5
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	adds r0, r5, #0
	movs r1, #0xa2
	bl sub_8003D84
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	adds r0, r5, #0
	movs r1, #0xba
	bl sub_8003D84
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
_0809063C:
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r5, #0
	movs r1, #0xb1
	bl sub_8003D84
	ldr r1, _080906A4 @ =0x081F5548
	adds r0, r5, #0
	bl sub_8003F28
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080906A0: .4byte 0x000004C5
_080906A4: .4byte 0x081F5548

