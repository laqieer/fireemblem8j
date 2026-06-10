	.syntax unified
	.set ArenaGenerateMatchupGoldValue, 0x08031DEC + 1
	.set ArenaSetFallbackWeaponsMaybe, 0x08031F14 + 1
	.set GetClassBestWRankType, 0x0803182C + 1
	.set GetClassData, 0x0801911C + 1
	.set GetUnitBestWRankType, 0x08031800 + 1
	.set IsWeaponMagic, 0x08031924 + 1
	.set sub_8031858, 0x08031858 + 1
	.set sub_8031944, 0x08031944 + 1
	.set sub_8031960, 0x08031960 + 1
	.set sub_80319D0, 0x080319D0 + 1
	.set sub_8031ABC, 0x08031ABC + 1
	.set sub_8031B5C, 0x08031B5C + 1
	.set sub_8031CA4, 0x08031CA4 + 1
	.set sub_8031E30, 0x08031E30 + 1
	.section .text.sub_80316E0, "ax", %progbits
@ sub_80316E0 @ JP 0x080316E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80316E0
	.thumb_func
sub_80316E0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08031744 @ =0x0203A8EC
	str r4, [r5]
	ldr r0, _08031748 @ =0x0203A90C
	str r0, [r5, #4]
	ldr r2, _0803174C @ =0x03003008
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	bl GetUnitBestWRankType
	strb r0, [r5, #0xd]
	ldrb r0, [r5, #0xd]
	bl sub_8031858
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x10]
	bl GetClassData
	bl GetClassBestWRankType
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #0xd]
	bl IsWeaponMagic
	strb r0, [r5, #0x13]
	ldrb r0, [r5, #0xe]
	bl IsWeaponMagic
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #8]
	strb r0, [r5, #0x11]
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _08031750
	ldrb r0, [r5, #0x11]
	bl sub_8031944
	b _08031758
	.align 2, 0
_08031744: .4byte 0x0203A8EC
_08031748: .4byte 0x0203A90C
_0803174C: .4byte 0x03003008
_08031750:
	ldrb r0, [r5, #0x11]
	bl sub_8031944
	adds r0, #7
_08031758:
	strb r0, [r5, #0x12]
	bl sub_80319D0
	bl sub_8031ABC
	movs r4, #0
	b _08031768
_08031766:
	adds r4, #1
_08031768:
	cmp r4, #9
	bgt _08031776
	bl sub_8031CA4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08031766
_08031776:
	movs r4, #0
	b _0803177C
_0803177A:
	adds r4, #1
_0803177C:
	cmp r4, #4
	bgt _0803178A
	bl sub_8031B5C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803177A
_0803178A:
	ldr r4, _080317BC @ =0x0203A8EC
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl sub_8031960
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl sub_8031960
	strh r0, [r4, #0x18]
	bl ArenaGenerateMatchupGoldValue
	movs r0, #1
	strb r0, [r4, #0xb]
	movs r0, #0
	bl sub_8031E30
	bl ArenaSetFallbackWeaponsMaybe
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080317BC: .4byte 0x0203A8EC

