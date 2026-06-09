	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemType, 0x080172F0 + 1
	.set InitText, 0x08003C8C + 1
	.set MakeBattlePopupTileMapFromTSA, 0x08077FAC + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set SetTextDrawNoClear, 0x08004360 + 1
	.set Text_Skip, 0x08003D88 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003520, 0x08003520 + 1
	.set sub_8003678, 0x08003678 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6390, 0x080D6390 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_80780DC, "ax", %progbits
@ sub_80780DC @ JP 0x080780DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80780DC
	.thumb_func
sub_80780DC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r7, r1, #0
	mov r8, r2
	ldr r0, _08078138 @ =0x08858088
	ldr r1, _0807813C @ =0x06002000
	bl sub_80D6390
	ldr r0, _08078140 @ =0x08858228
	ldr r1, _08078144 @ =0x02019790
	bl sub_80D6394
	ldr r0, _08078148 @ =0x02017648
	ldr r1, _0807814C @ =0x06002100
	movs r2, #0x84
	lsls r2, r2, #1
	movs r3, #1
	bl sub_8003BE8
	bl SetTextDrawNoClear
	ldr r0, _08078150 @ =0x08858208
	ldr r1, _08078154 @ =0x020228C8
	movs r2, #8
	bl sub_80D636C
	cmp r7, #0
	bne _0807815C
	movs r0, #0x80
	lsls r0, r0, #4
	bl sub_8009FA8
	adds r4, r0, #0
	bl sub_8003E0C
	mov sb, r0
	mov r5, sb
	adds r5, #0x10
	ldr r0, _08078158 @ =0x00000801
	b _08078176
	.align 2, 0
_08078138: .4byte 0x08858088
_0807813C: .4byte 0x06002000
_08078140: .4byte 0x08858228
_08078144: .4byte 0x02019790
_08078148: .4byte 0x02017648
_0807814C: .4byte 0x06002100
_08078150: .4byte 0x08858208
_08078154: .4byte 0x020228C8
_08078158: .4byte 0x00000801
_0807815C:
	cmp r7, #1
	bne _08078188
	movs r0, #0
	mov sb, r0
	mov r0, r8
	bl sub_801729C
	adds r4, r0, #0
	bl sub_8003E0C
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _08078184 @ =0x00000802
_08078176:
	bl sub_8009FA8
	adds r4, r0, #0
	bl sub_8003E0C
	adds r4, r0, r5
	b _0807819C
	.align 2, 0
_08078184: .4byte 0x00000802
_08078188:
	movs r1, #0
	mov sb, r1
	ldr r0, _080781F8 @ =0x0000080B
	bl sub_8009FA8
	adds r4, r0, #0
	bl sub_8003E0C
	adds r4, r0, #0
	adds r4, #0x10
_0807819C:
	adds r0, r4, #7
	asrs r6, r0, #3
	ldr r0, _080781FC @ =0x020234A8
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	bl MakeBattlePopupTileMapFromTSA
	ldr r5, _08078200 @ =0x02017660
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitText
	lsls r0, r6, #3
	subs r0, r0, r4
	asrs r0, r0, #1
	mov sl, r0
	adds r0, r5, #0
	mov r1, sl
	bl sub_8003D84
	ldr r0, _08078204 @ =0x08858128
	ldr r1, _08078208 @ =0x06002100
	bl sub_80D6390
	cmp r7, #0
	bne _08078210
	movs r0, #0x80
	lsls r0, r0, #4
	bl sub_8009FA8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8003F28
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Skip
	ldr r0, _0807820C @ =0x00000801
	b _08078236
	.align 2, 0
_080781F8: .4byte 0x0000080B
_080781FC: .4byte 0x020234A8
_08078200: .4byte 0x02017660
_08078204: .4byte 0x08858128
_08078208: .4byte 0x06002100
_0807820C: .4byte 0x00000801
_08078210:
	cmp r7, #1
	bne _08078254
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Skip
	mov r0, r8
	bl sub_801729C
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl sub_8003D90
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8003F28
	ldr r0, _08078250 @ =0x00000802
_08078236:
	bl sub_8009FA8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8003F28
	b _08078274
	.align 2, 0
_08078250: .4byte 0x00000802
_08078254:
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Skip
	ldr r0, _080782AC @ =0x0000080B
	bl sub_8009FA8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8003F28
_08078274:
	adds r1, r6, #2
	lsls r1, r1, #3
	movs r0, #0xe0
	subs r0, r0, r1
	asrs r4, r0, #1
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080782B0 @ =0x0000FFD0
	movs r0, #1
	bl BG_SetPosition
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_80034C4
	cmp r7, #0
	bne _080782B4
	movs r0, #1
	movs r1, #0x12
	bl sub_8003520
	mov r0, r8
	bl GetItemType
	adds r0, #0x70
	b _080782C6
	.align 2, 0
_080782AC: .4byte 0x0000080B
_080782B0: .4byte 0x0000FFD0
_080782B4:
	cmp r7, #1
	bne _080782CE
	movs r0, #0
	movs r1, #0x12
	bl sub_8003520
	mov r0, r8
	bl GetItemIconId
_080782C6:
	movs r1, #0x40
	bl sub_8003678
	b _080782E0
_080782CE:
	movs r0, #1
	movs r1, #0x12
	bl sub_8003520
	mov r0, r8
	adds r0, #0x70
	movs r1, #0x40
	bl sub_8003678
_080782E0:
	ldr r0, _08078330 @ =0x087E1A70
	movs r1, #0x96
	bl AnimCreate
	ldr r1, [sp]
	str r0, [r1, #0x60]
	movs r1, #0x91
	lsls r1, r1, #6
	strh r1, [r0, #8]
	mov r1, sl
	adds r1, #0x10
	adds r1, r4, r1
	add r1, sb
	strh r1, [r0, #2]
	movs r1, #0x38
	strh r1, [r0, #4]
	bl sub_8001EE4
	bl SetDefaultColorEffects
	ldr r2, _08078334 @ =0x03003020
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
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078330: .4byte 0x087E1A70
_08078334: .4byte 0x03003020

