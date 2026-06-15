	.syntax unified
	.set CheckBanimHensei, 0x08078730 + 1
	.set CheckBattleScripted, 0x080599AC + 1
	.set GetBanimBackgroundIndex, 0x08058D1C + 1
	.set GetBanimFactionPalette, 0x080597E4 + 1
	.set GetBanimTerrainGround, 0x08058BF4 + 1
	.set GetBattleAnimPreconfType, 0x0802C9D0 + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set GetSelectTargetCount, 0x08050AC8 + 1
	.set GetSpellAssocCharCount, 0x0807A66C + 1
	.set IsItemEffectiveAgainst, 0x08016994 + 1
	.set IsUnitEffectiveAgainst, 0x08016A30 + 1
	.set ResetEkrDragonStatus, 0x08071FAC + 1
	.set SetEkrDragonStatusType, 0x08072034 + 1
	.set sub_8050ABC, 0x08050ABC + 1
	.set sub_8058E44, 0x08058E44 + 1
	.set sub_8058FE8, 0x08058FE8 + 1
	.set sub_8059034, 0x08059034 + 1
	.set sub_8059678, 0x08059678 + 1
	.set sub_8059790, 0x08059790 + 1
	.set sub_80598BC, 0x080598BC + 1
	.set sub_80599A0, 0x080599A0 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.section .text.sub_8057F80, "ax", %progbits
@ sub_8057F80 @ JP 0x08057F80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057F80
	.thumb_func
sub_8057F80:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	bl ResetEkrDragonStatus
	ldr r0, _08057FA4 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08057FA8
	movs r0, #0
	bl SetBanimArenaFlag
	b _08057FAE
	.align 2, 0
_08057FA4: .4byte 0x0203A4D0
_08057FA8:
	movs r0, #1
	bl SetBanimArenaFlag
_08057FAE:
	ldr r0, _08057FC4 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08057FC8
	movs r0, #0
	bl sub_8050ABC
	b _08057FCE
	.align 2, 0
_08057FC4: .4byte 0x0202BCAC
_08057FC8:
	movs r0, #1
	bl sub_8050ABC
_08057FCE:
	ldr r0, _08057FE8 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08057FF0
	ldr r1, _08057FEC @ =0x0203E11C
	movs r0, #4
	strh r0, [r1]
	mov r8, r1
	b _08057FF6
	.align 2, 0
_08057FE8: .4byte 0x0203A4D0
_08057FEC: .4byte 0x0203E11C
_08057FF0:
	ldr r0, _08058028 @ =0x0203E11C
	strh r2, [r0]
	mov r8, r0
_08057FF6:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	bne _08058044
	ldr r1, _0805802C @ =0x0203E184
	ldr r0, _08058030 @ =0x0203A4E8
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08058034 @ =0x0203E188
	ldr r0, _08058038 @ =0x0203A568
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _0805803C @ =0x0203E104
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r0, _08058040 @ =0x0203E100
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r4, [sp, #8]
	adds r3, r0, #0
	b _08058138
	.align 2, 0
_08058028: .4byte 0x0203E11C
_0805802C: .4byte 0x0203E184
_08058030: .4byte 0x0203A4E8
_08058034: .4byte 0x0203E188
_08058038: .4byte 0x0203A568
_0805803C: .4byte 0x0203E104
_08058040: .4byte 0x0203E100
_08058044:
	ldr r6, _08058084 @ =0x0203A4E8
	ldrb r1, [r6, #0xb]
	movs r4, #0x40
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	bl GetBanimFactionPalette
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, _08058088 @ =0x0203A568
	ldrb r0, [r0, #0xb]
	ands r4, r0
	adds r0, r4, #0
	bl GetBanimFactionPalette
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, _0805808C @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0805807E
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	cmp r0, #0
	bne _08058090
_0805807E:
	movs r6, #2
	b _080580A2
	.align 2, 0
_08058084: .4byte 0x0203A4E8
_08058088: .4byte 0x0203A568
_0805808C: .4byte 0x0203A4D0
_08058090:
	ldrh r0, [r1]
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocCharCount
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080580A2:
	ldr r1, _080580F4 @ =0x0203E100
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	bl GetSelectTargetCount
	cmp r0, #1
	beq _080580C6
	cmp r5, #0
	beq _080580C4
	cmp r5, #2
	beq _080580C4
	cmp r5, #1
	bne _080580C6
	cmp r7, #1
	bne _080580C6
_080580C4:
	movs r4, #1
_080580C6:
	cmp r4, #1
	bne _08058110
	ldr r1, _080580F8 @ =0x0203E184
	ldr r0, _080580FC @ =0x0203A568
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08058100 @ =0x0203E188
	ldr r0, _08058104 @ =0x0203A4E8
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, _08058108 @ =0x0203E104
	movs r1, #0
	strh r4, [r0]
	strh r1, [r0, #2]
	ldr r3, _0805810C @ =0x0203E11C
	mov r8, r3
	ldr r4, [sp, #0xc]
	ldr r3, _080580F4 @ =0x0203E100
	cmp r6, #1
	bne _08058138
	strh r1, [r3]
	b _08058138
	.align 2, 0
_080580F4: .4byte 0x0203E100
_080580F8: .4byte 0x0203E184
_080580FC: .4byte 0x0203A568
_08058100: .4byte 0x0203E188
_08058104: .4byte 0x0203A4E8
_08058108: .4byte 0x0203E104
_0805810C: .4byte 0x0203E11C
_08058110:
	ldr r1, _080581F0 @ =0x0203E184
	ldr r0, _080581F4 @ =0x0203A4E8
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _080581F8 @ =0x0203E188
	ldr r0, _080581FC @ =0x0203A568
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _08058200 @ =0x0203E104
	movs r2, #0
	strh r2, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r4, _08058204 @ =0x0203E11C
	mov r8, r4
	ldr r4, [sp, #8]
	ldr r3, _08058208 @ =0x0203E100
	cmp r6, #1
	bne _08058138
	strh r2, [r3, #2]
_08058138:
	ldr r6, [sp, #8]
	mov sl, r6
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x18]
	ldr r1, [r6]
	str r1, [sp, #0x10]
	ldr r2, [r0]
	str r2, [sp, #0x14]
	movs r6, #0
	str r6, [sp, #0x1c]
	movs r5, #0
	movs r0, #0
	ldrsh r7, [r3, r0]
	movs r2, #2
	ldrsh r1, [r3, r2]
	mov sb, r1
	cmp r7, #0
	beq _08058162
	mov r3, sl
	ldr r0, [r3, #4]
	ldr r5, [r0, #0x34]
_08058162:
	mov r6, sb
	cmp r6, #0
	beq _08058170
	ldr r1, [sp, #0x18]
	ldr r0, [r1, #4]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x1c]
_08058170:
	cmp r7, #0
	beq _0805819C
	ldr r3, _0805820C @ =0x0203E11E
	mov r2, sl
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	ldr r2, _08058210 @ =0x0202BCAC
	movs r6, #0xc
	ldrsh r1, [r2, r6]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3]
	mov r1, sl
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r6, #0xe
	ldrsh r1, [r2, r6]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #2]
_0805819C:
	mov r0, sb
	cmp r0, #0
	beq _080581CA
	ldr r3, _0805820C @ =0x0203E11E
	ldr r1, [sp, #0x18]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _08058210 @ =0x0202BCAC
	movs r6, #0xc
	ldrsh r1, [r2, r6]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #4]
	ldr r1, [sp, #0x18]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r6, #0xe
	ldrsh r1, [r2, r6]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #6]
_080581CA:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	beq _0805829E
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08058214
	movs r0, #2
	mov r3, r8
	strh r0, [r3]
	b _08058294
	.align 2, 0
_080581F0: .4byte 0x0203E184
_080581F4: .4byte 0x0203A4E8
_080581F8: .4byte 0x0203E188
_080581FC: .4byte 0x0203A568
_08058200: .4byte 0x0203E104
_08058204: .4byte 0x0203E11C
_08058208: .4byte 0x0203E100
_0805820C: .4byte 0x0203E11E
_08058210: .4byte 0x0202BCAC
_08058214:
	movs r0, #3
	mov r4, r8
	strh r0, [r4]
	mov r6, sb
	adds r0, r7, r6
	cmp r0, #2
	bne _08058294
	ldr r0, _0805823C @ =0x0203E11E
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #4
	ldrsh r2, [r0, r3]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0
	blt _08058240
	ldrh r0, [r2]
	ldrh r1, [r2, #4]
	b _08058244
	.align 2, 0
_0805823C: .4byte 0x0203E11E
_08058240:
	ldrh r0, [r2, #4]
	ldrh r1, [r2]
_08058244:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r3, r0, #0
	movs r4, #2
	ldrsh r0, [r2, r4]
	movs r6, #6
	ldrsh r1, [r2, r6]
	subs r0, r0, r1
	cmp r0, #0
	blt _08058260
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #6]
	b _08058264
_08058260:
	ldrh r0, [r2, #6]
	ldrh r1, [r2, #2]
_08058264:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r3, r0
	cmp r0, #1
	bgt _0805827C
	ldr r1, _08058278 @ =0x0203E11C
	movs r0, #0
	b _08058290
	.align 2, 0
_08058278: .4byte 0x0203E11C
_0805827C:
	cmp r0, #3
	bgt _0805828C
	ldr r1, _08058288 @ =0x0203E11C
	movs r0, #1
	b _08058290
	.align 2, 0
_08058288: .4byte 0x0203E11C
_0805828C:
	ldr r1, _080582D4 @ =0x0203E11C
	movs r0, #2
_08058290:
	strh r0, [r1]
	mov r8, r1
_08058294:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	bne _08058310
_0805829E:
	ldr r3, [sp, #8]
	adds r3, #0x48
	mov r8, r3
	ldrh r2, [r3]
	mov r0, sl
	adds r1, r5, #0
	mov r3, sp
	bl sub_8059678
	ldr r6, _080582D8 @ =0x0203E17E
	ldr r4, _080582DC @ =0x0203E108
	strh r0, [r4]
	strh r0, [r6]
	ldr r5, [sp, #0xc]
	adds r5, #0x48
	ldrh r2, [r5]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl sub_8059678
	strh r0, [r4, #2]
	strh r0, [r6, #2]
	mov r4, r8
	str r4, [sp, #0x20]
	str r5, [sp, #0x24]
	b _08058356
	.align 2, 0
_080582D4: .4byte 0x0203E11C
_080582D8: .4byte 0x0203E17E
_080582DC: .4byte 0x0203E108
_080582E0:
	ldr r0, _080582F0 @ =0x0203E10C
	ldr r1, _080582F4 @ =0x089CEC18
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0]
	b _0805839E
	.align 2, 0
_080582F0: .4byte 0x0203E10C
_080582F4: .4byte 0x089CEC18
_080582F8:
	ldr r0, _08058308 @ =0x0203E10C
	ldr r1, _0805830C @ =0x089CEC18
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0, #2]
	b _080583DC
	.align 2, 0
_08058308: .4byte 0x0203E10C
_0805830C: .4byte 0x089CEC18
_08058310:
	cmp r7, #0
	beq _0805832C
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r2, [r0]
	mov r0, sl
	adds r1, r5, #0
	mov r3, sp
	bl sub_8059678
	ldr r2, _080584F0 @ =0x0203E17E
	ldr r1, _080584F4 @ =0x0203E108
	strh r0, [r1]
	strh r0, [r2]
_0805832C:
	ldr r6, [sp, #8]
	adds r6, #0x48
	str r6, [sp, #0x20]
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	str r0, [sp, #0x24]
	mov r1, sb
	cmp r1, #0
	beq _08058356
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r2, [r0]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl sub_8059678
	ldr r2, _080584F0 @ =0x0203E17E
	ldr r1, _080584F4 @ =0x0203E108
	strh r0, [r1, #2]
	strh r0, [r2, #2]
_08058356:
	mov r2, sl
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r3, [r0, #4]
	cmp r7, #0
	beq _08058372
	ldr r1, _080584F8 @ =0x0203E10C
	ldr r0, _080584FC @ =0x0000FFFF
	strh r0, [r1]
_08058372:
	movs r1, #0
	lsls r0, r2, #3
	ldr r4, [sp, #8]
	adds r4, #0x55
	mov r8, r4
	ldr r6, [sp, #0xc]
	adds r6, #0x55
	str r6, [sp, #0x28]
	ldr r6, _08058500 @ =0x089CDE18
	subs r4, r0, r2
_08058386:
	adds r2, r1, r4
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r3
	bne _08058394
	cmp r7, #0
	bne _080582E0
_08058394:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #6
	bls _08058386
_0805839E:
	ldr r1, [sp, #0x18]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r1, #4]
	ldrb r3, [r0, #4]
	mov r4, sb
	cmp r4, #0
	beq _080583BA
	ldr r1, _080584F8 @ =0x0203E10C
	ldr r0, _080584FC @ =0x0000FFFF
	strh r0, [r1, #2]
_080583BA:
	movs r1, #0
	lsls r0, r2, #3
	ldr r6, _08058500 @ =0x089CDE18
	subs r4, r0, r2
_080583C2:
	adds r2, r1, r4
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r3
	bne _080583D2
	mov r0, sb
	cmp r0, #0
	bne _080582F8
_080583D2:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #6
	bls _080583C2
_080583DC:
	cmp r7, #0
	beq _080583F4
	ldr r0, _080584F0 @ =0x0203E17E
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_8059790
	ldr r1, _08058504 @ =0x0203E198
	str r0, [r1]
_080583F4:
	mov r2, sb
	cmp r2, #0
	beq _0805840E
	ldr r0, _080584F0 @ =0x0203E17E
	movs r3, #2
	ldrsh r0, [r0, r3]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_8059790
	ldr r1, _08058504 @ =0x0203E198
	str r0, [r1, #4]
_0805840E:
	ldr r5, _08058508 @ =0x0203E1C8
	mov r4, r8
	ldrb r0, [r4]
	strh r0, [r5]
	ldr r6, [sp, #0x28]
	ldrb r0, [r6]
	strh r0, [r5, #2]
	ldr r6, _0805850C @ =0x0203E118
	ldr r0, _080584FC @ =0x0000FFFF
	strh r0, [r6, #2]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r6]
	cmp r7, #0
	beq _08058444
	ldrb r4, [r4]
	ldr r0, _08058510 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r6]
_08058444:
	mov r0, sb
	cmp r0, #0
	beq _08058464
	ldr r1, [sp, #0x28]
	ldrb r4, [r1]
	ldr r0, _08058510 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r6, #2]
_08058464:
	ldr r0, _08058514 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080584AE
	movs r0, #0x30
	strh r0, [r5]
	strh r0, [r5, #2]
	cmp r7, #0
	beq _08058490
	ldr r0, _08058510 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	movs r0, #0x30
	bl GetBanimTerrainGround
	strh r0, [r6]
_08058490:
	mov r2, sb
	cmp r2, #0
	beq _080584AE
	ldrh r4, [r5, #2]
	ldr r0, _08058510 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r6, #2]
_080584AE:
	bl CheckBanimHensei
	cmp r0, #1
	bne _080584C6
	ldr r1, _0805850C @ =0x0203E118
	movs r0, #0x14
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r1, _08058508 @ =0x0203E1C8
	movs r0, #0x30
	strh r0, [r1, #2]
	strh r0, [r1]
_080584C6:
	ldr r0, _08058518 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _080584DE
	cmp r0, #3
	ble _080584DE
	cmp r0, #4
	bne _080584DE
	ldr r1, _0805850C @ =0x0203E118
	ldrh r0, [r1, #2]
	strh r0, [r1]
_080584DE:
	ldr r0, _08058510 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	cmp r0, #2
	bgt _08058520
	cmp r0, #1
	blt _08058520
	ldr r1, _0805851C @ =0x0203E0FE
	movs r0, #1
	b _08058524
	.align 2, 0
_080584F0: .4byte 0x0203E17E
_080584F4: .4byte 0x0203E108
_080584F8: .4byte 0x0203E10C
_080584FC: .4byte 0x0000FFFF
_08058500: .4byte 0x089CDE18
_08058504: .4byte 0x0203E198
_08058508: .4byte 0x0203E1C8
_0805850C: .4byte 0x0203E118
_08058510: .4byte 0x0202BCEC
_08058514: .4byte 0x0202BCAC
_08058518: .4byte 0x0203E11C
_0805851C: .4byte 0x0203E0FE
_08058520:
	ldr r1, _080585A0 @ =0x0203E0FE
	movs r0, #0
_08058524:
	strh r0, [r1]
	cmp r7, #0
	beq _08058538
	ldr r0, _080585A4 @ =0x0203E1CC
	mov r4, sl
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
_08058538:
	mov r6, sb
	cmp r6, #0
	beq _0805854C
	ldr r0, _080585A4 @ =0x0203E1CC
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #2]
_0805854C:
	cmp r7, #0
	beq _08058568
	ldr r1, _080585A8 @ =0x0203E1A8
	ldr r0, [sp, #8]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r1, _080585AC @ =0x0203E1AC
	mov r3, sl
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r1]
_08058568:
	mov r4, sb
	cmp r4, #0
	beq _08058586
	ldr r1, _080585A8 @ =0x0203E1A8
	ldr r0, [sp, #0xc]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
	ldr r1, _080585AC @ =0x0203E1AC
	ldr r6, [sp, #0x18]
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r1, #2]
_08058586:
	bl sub_8059034
	ldr r0, _080585B0 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne _080585B8
	ldr r1, _080585B4 @ =0x0203E114
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _08058616
	.align 2, 0
_080585A0: .4byte 0x0203E0FE
_080585A4: .4byte 0x0203E1CC
_080585A8: .4byte 0x0203E1A8
_080585AC: .4byte 0x0203E1AC
_080585B0: .4byte 0x0203E11C
_080585B4: .4byte 0x0203E114
_080585B8:
	cmp r7, #0
	beq _080585D0
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_8058E44
	ldr r1, _0805865C @ =0x0203E114
	strh r0, [r1]
_080585D0:
	mov r3, sb
	cmp r3, #0
	beq _080585EA
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_8058E44
	ldr r1, _0805865C @ =0x0203E114
	strh r0, [r1, #2]
_080585EA:
	ldr r0, _08058660 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08058616
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_80598BC
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08058616
	ldr r6, [sp, #0x18]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne _08058616
	ldr r1, _0805865C @ =0x0203E114
	movs r0, #0xf
	strh r0, [r1, #2]
_08058616:
	cmp r7, #0
	beq _08058628
	ldr r0, _0805865C @ =0x0203E114
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl sub_8058FE8
_08058628:
	mov r0, sb
	cmp r0, #0
	beq _0805863C
	ldr r0, _08058664 @ =0x0203E116
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl sub_8058FE8
_0805863C:
	ldr r0, _08058668 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08058686
	cmp r0, #2
	bgt _08058686
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x65
	beq _0805866C
	cmp r0, #0x66
	beq _0805867C
	b _08058686
	.align 2, 0
_0805865C: .4byte 0x0203E114
_08058660: .4byte 0x0203A4D0
_08058664: .4byte 0x0203E116
_08058668: .4byte 0x0203E11C
_0805866C:
	ldr r0, _08058678 @ =0x02000000
	ldr r0, [r0]
	movs r1, #1
	bl SetEkrDragonStatusType
	b _08058686
	.align 2, 0
_08058678: .4byte 0x02000000
_0805867C:
	ldr r0, _08058924 @ =0x02000000
	ldr r0, [r0]
	movs r1, #2
	bl SetEkrDragonStatusType
_08058686:
	cmp r7, #0
	beq _0805869C
	mov r3, sl
	ldrb r1, [r3, #0xb]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r1
	bl GetBanimFactionPalette
	ldr r1, _08058928 @ =0x0203E110
	strh r0, [r1]
_0805869C:
	mov r4, sb
	cmp r4, #0
	beq _080586B4
	ldr r6, [sp, #0x18]
	ldrb r1, [r6, #0xb]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r1
	bl GetBanimFactionPalette
	ldr r1, _08058928 @ =0x0203E110
	strh r0, [r1, #2]
_080586B4:
	ldr r1, _0805892C @ =0x0203E18C
	movs r6, #0
	strb r6, [r1, #1]
	strb r6, [r1]
	cmp r7, #0
	beq _080586C6
	ldr r2, [sp, #0x10]
	ldrb r0, [r2, #4]
	strb r0, [r1]
_080586C6:
	mov r3, sb
	cmp r3, #0
	beq _080586D2
	ldr r4, [sp, #0x14]
	ldrb r0, [r4, #4]
	strb r0, [r1, #1]
_080586D2:
	ldr r3, _08058930 @ =0x0203E1B4
	cmp r7, #0
	beq _080586E0
	ldr r0, [sp, #8]
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r3]
_080586E0:
	mov r0, sb
	cmp r0, #0
	beq _080586EE
	ldr r0, [sp, #0xc]
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r3, #2]
_080586EE:
	adds r1, r3, #0
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0xff
	bne _080586FE
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r1]
_080586FE:
	ldrh r1, [r3, #2]
	movs r2, #2
	ldrsh r0, [r3, r2]
	cmp r0, #0xff
	bne _0805870C
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r3, #2]
_0805870C:
	cmp r7, #0
	beq _08058746
	ldr r4, _08058938 @ =0x0203E1B8
	ldr r2, [sp, #8]
	adds r2, #0x5a
	ldr r0, [sp, #0xc]
	adds r0, #0x5c
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0805872A
	strh r6, [r4]
_0805872A:
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xff
	bne _08058736
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4]
_08058736:
	ldr r6, [sp, #0x20]
	ldrh r0, [r6]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _08058746
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4]
_08058746:
	mov r0, sb
	cmp r0, #0
	beq _08058784
	ldr r4, _08058938 @ =0x0203E1B8
	ldr r2, [sp, #0xc]
	adds r2, #0x5a
	ldr r0, [sp, #8]
	adds r0, #0x5c
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4, #2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _08058768
	movs r0, #0
	strh r0, [r4, #2]
_08058768:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0xff
	bne _08058774
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4, #2]
_08058774:
	ldr r2, [sp, #0x24]
	ldrh r0, [r2]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _08058784
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4, #2]
_08058784:
	ldr r6, _0805893C @ =0x0203E1BC
	cmp r7, #0
	beq _08058792
	ldr r0, [sp, #8]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r6]
_08058792:
	mov r3, sb
	cmp r3, #0
	beq _080587A0
	ldr r0, [sp, #0xc]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r6, #2]
_080587A0:
	adds r4, r6, #0
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	bne _080587B0
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4]
_080587B0:
	ldrh r1, [r4, #2]
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r0, #0xff
	bne _080587BE
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4, #2]
_080587BE:
	ldr r1, [sp, #0x20]
	ldrh r0, [r1]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _080587CE
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4]
_080587CE:
	ldr r2, [sp, #0x24]
	ldrh r0, [r2]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _080587DE
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r4, #2]
_080587DE:
	ldr r2, _08058940 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #4
	bne _080587F8
	ldr r1, _08058930 @ =0x0203E1B4
	ldr r0, _08058934 @ =0x0000FFFF
	strh r0, [r1, #2]
	ldr r1, _08058938 @ =0x0203E1B8
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	strh r0, [r6, #2]
_080587F8:
	cmp r7, #0
	beq _0805880A
	ldr r1, _08058944 @ =0x0203E1C0
	ldr r0, [sp, #8]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_0805880A:
	mov r4, sb
	cmp r4, #0
	beq _0805881E
	ldr r1, _08058944 @ =0x0203E1C0
	ldr r0, [sp, #0xc]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_0805881E:
	cmp r7, #0
	beq _08058830
	ldr r1, _08058948 @ =0x0203E1C4
	ldr r0, [sp, #8]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08058830:
	mov r6, sb
	cmp r6, #0
	beq _08058844
	ldr r1, _08058948 @ =0x0203E1C4
	ldr r0, [sp, #0xc]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08058844:
	ldr r1, _0805894C @ =0x0203E1D0
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #4
	beq _080588DE
	cmp r7, #0
	beq _08058864
	ldr r0, [sp, #8]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08058864:
	mov r4, sb
	cmp r4, #0
	beq _08058876
	ldr r0, [sp, #0xc]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08058876:
	cmp r7, #0
	beq _0805888A
	mov r0, sl
	ldr r1, [sp, #0x18]
	bl IsUnitEffectiveAgainst
	ldr r1, _08058950 @ =0x0203E1D4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_0805888A:
	mov r6, sb
	cmp r6, #0
	beq _080588A0
	ldr r0, [sp, #0x18]
	mov r1, sl
	bl IsUnitEffectiveAgainst
	ldr r1, _08058950 @ =0x0203E1D4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_080588A0:
	ldr r4, _08058950 @ =0x0203E1D4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080588BE
	cmp r7, #0
	beq _080588BE
	ldr r2, [sp, #0x20]
	ldrh r0, [r2]
	ldr r1, [sp, #0x18]
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
_080588BE:
	ldr r4, _08058950 @ =0x0203E1D4
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _080588DE
	mov r6, sb
	cmp r6, #0
	beq _080588DE
	ldr r1, [sp, #0x24]
	ldrh r0, [r1]
	mov r1, sl
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
_080588DE:
	ldr r0, _08058954 @ =0x0203E1A0
	movs r4, #0
	str r4, [r0, #4]
	str r4, [r0]
	cmp r7, #0
	beq _080588F4
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
_080588F4:
	mov r2, sb
	cmp r2, #0
	beq _08058904
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
_08058904:
	bl GetSelectTargetCount
	cmp r0, #1
	beq _08058918
	ldr r0, _08058958 @ =0x0202BCEC
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08058960
_08058918:
	ldr r1, _0805895C @ =0x0203E1D8
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _08058966
	.align 2, 0
_08058924: .4byte 0x02000000
_08058928: .4byte 0x0203E110
_0805892C: .4byte 0x0203E18C
_08058930: .4byte 0x0203E1B4
_08058934: .4byte 0x0000FFFF
_08058938: .4byte 0x0203E1B8
_0805893C: .4byte 0x0203E1BC
_08058940: .4byte 0x0203E11C
_08058944: .4byte 0x0203E1C0
_08058948: .4byte 0x0203E1C4
_0805894C: .4byte 0x0203E1D0
_08058950: .4byte 0x0203E1D4
_08058954: .4byte 0x0203E1A0
_08058958: .4byte 0x0202BCEC
_0805895C: .4byte 0x0203E1D8
_08058960:
	ldr r0, _08058984 @ =0x0203E1D8
	strh r4, [r0, #2]
	strh r4, [r0]
_08058966:
	ldr r5, _08058988 @ =0x0203E0FA
	movs r0, #0
	strh r0, [r5]
	bl GetBattleAnimPreconfType
	cmp r0, #3
	bne _080589AE
	ldr r0, _0805898C @ =0x0203E100
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08058994
	ldr r0, _08058990 @ =0x0203E1C8
	ldrh r4, [r0]
	b _08058998
	.align 2, 0
_08058984: .4byte 0x0203E1D8
_08058988: .4byte 0x0203E0FA
_0805898C: .4byte 0x0203E100
_08058990: .4byte 0x0203E1C8
_08058994:
	ldr r0, _08058AC4 @ =0x0203E1C8
	ldrh r4, [r0, #2]
_08058998:
	ldr r0, _08058AC8 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimBackgroundIndex
	strh r0, [r5]
_080589AE:
	bl CheckBanimHensei
	cmp r0, #1
	bne _080589BC
	ldr r1, _08058ACC @ =0x0203E0FA
	movs r0, #0x3c
	strh r0, [r1]
_080589BC:
	movs r4, #0
	bl GetBattleAnimPreconfType
	cmp r0, #0
	bne _080589C8
	movs r4, #1
_080589C8:
	bl GetBattleAnimPreconfType
	cmp r0, #3
	bne _080589D2
	movs r4, #1
_080589D2:
	bl GetBattleAnimPreconfType
	cmp r0, #1
	bne _080589FE
	ldr r0, _08058AD0 @ =0x0203E11C
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #4
	bne _080589E6
	movs r4, #1
_080589E6:
	bl sub_805BDCC
	cmp r0, #1
	bne _080589F0
	movs r4, #1
_080589F0:
	bl CheckBattleScripted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080589FE
	movs r4, #1
_080589FE:
	bl sub_80599A0
	ldr r0, _08058AD0 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	beq _08058A24
	mov r2, sl
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08058AC0
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08058AC0
_08058A24:
	cmp r4, #0
	beq _08058AC0
	ldr r0, _08058AD4 @ =0x0203E100
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r3, r0, #0
	cmp r1, #1
	bne _08058A76
	mov r0, sl
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08058AC0
	ldr r0, _08058AD8 @ =0x0203E17E
	movs r6, #0
	ldrsh r0, [r0, r6]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08058AC0
	ldr r0, _08058ADC @ =0x0203E114
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08058AC0
	ldr r0, _08058AE0 @ =0x0203E118
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, r2
	beq _08058AC0
	ldr r0, _08058AC4 @ =0x0203E1C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x1b
	beq _08058AC0
	cmp r0, #0x33
	beq _08058AC0
_08058A76:
	movs r2, #2
	ldrsh r0, [r3, r2]
	cmp r0, #1
	bne _08058AE4
	ldr r0, [sp, #0x18]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08058AC0
	ldr r0, _08058AD8 @ =0x0203E17E
	movs r3, #2
	ldrsh r0, [r0, r3]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08058AC0
	ldr r0, _08058ADC @ =0x0203E114
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08058AC0
	ldr r0, _08058AE0 @ =0x0203E118
	movs r6, #2
	ldrsh r0, [r0, r6]
	cmp r0, r2
	beq _08058AC0
	ldr r0, _08058AC4 @ =0x0203E1C8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x1b
	beq _08058AC0
	cmp r0, #0x33
	bne _08058AE4
_08058AC0:
	movs r0, #0
	b _08058AE6
	.align 2, 0
_08058AC4: .4byte 0x0203E1C8
_08058AC8: .4byte 0x0202BCEC
_08058ACC: .4byte 0x0203E0FA
_08058AD0: .4byte 0x0203E11C
_08058AD4: .4byte 0x0203E100
_08058AD8: .4byte 0x0203E17E
_08058ADC: .4byte 0x0203E114
_08058AE0: .4byte 0x0203E118
_08058AE4:
	movs r0, #1
_08058AE6:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

