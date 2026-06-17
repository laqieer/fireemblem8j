	.syntax unified
	.set AnimScrAdvance, 0x0805A670 + 1
	.set AnimSort, 0x08004EB4 + 1
	.set CheckEkrHitDone, 0x08052FC4 + 1
	.set Get0201FAC8, 0x080569CC + 1
	.set GetAISLayerId, 0x0805AEF8 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundTypeFlags, 0x08059864 + 1
	.set GetUnitEfxDebuff, 0x080558AC + 1
	.set NewEfxFlashFX, 0x0806FA04 + 1
	.set NewEfxKingPika, 0x0806F978 + 1
	.set NewEfxSkillCommonBG, 0x08070B68 + 1
	.set NewEfxSpecalEffect, 0x0806FBEC + 1
	.set Set0201FAC8, 0x080569D8 + 1
	.set SetUnitEfxDebuff, 0x0805587C + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_805441C, 0x0805441C + 1
	.set sub_80569E4, 0x080569E4 + 1
	.set sub_805A488, 0x0805A488 + 1
	.set sub_805A6B0, 0x0805A6B0 + 1
	.set SwitchAISFrameDataFromBARoundType, 0x0805AE20 + 1
	.set sub_805AF28, 0x0805AF28 + 1
	.set sub_805B094, 0x0805B094 + 1
	.set sub_805B0B4, 0x0805B0B4 + 1
	.set sub_805B0D8, 0x0805B0D8 + 1
	.set sub_805C170, 0x0805C170 + 1
	.set sub_806EA40, 0x0806EA40 + 1
	.set sub_806EBA0, 0x0806EBA0 + 1
	.set sub_806EF84, 0x0806EF84 + 1
	.set sub_806F154, 0x0806F154 + 1
	.set sub_806F3A4, 0x0806F3A4 + 1
	.set sub_806F63C, 0x0806F63C + 1
	.set sub_806F88C, 0x0806F88C + 1
	.set sub_807004C, 0x0807004C + 1
	.set sub_807032C, 0x0807032C + 1
	.set sub_80704AC, 0x080704AC + 1
	.set sub_80705C8, 0x080705C8 + 1
	.set NewEfxSkillType01BG, 0x08070918 + 1
	.set sub_8074050, 0x08074050 + 1
	.set sub_80748E4, 0x080748E4 + 1
	.set _0805A650, 0x0805A650
	.section .text.sub_8059A04, "ax", %progbits
@ sub_8059A04 @ JP 0x08059A04-0x0805A488 - region-different, gbadisasm descriptive asm (merged run, D24)
	.thumb
	.global sub_8059A04
	.thumb_func
sub_8059A04:
	ldr r0, _08059A68 @ =0x03004F9C
	str r2, [r0]
	ldr r1, _08059A6C @ =0x02000000
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r7, [r0]
	adds r2, #1
	mov sb, r2
	cmp r7, #0
	bne _08059A1C
	bl _0805A650
_08059A1C:
	ldrh r0, [r7, #0xc]
	movs r1, #0xf0
	lsls r1, r1, #8
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	cmp r2, #0
	bne _08059A32
	bl _0805A650
_08059A32:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	bne _08059A40
	bl sub_805A488
_08059A40:
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	bne _08059A4A
	bl _0805A47E
_08059A4A:
	subs r1, r0, #1
	adds r2, r7, #0
	adds r2, #0x15
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x7b
	bls _08059A5E
	bl _0805A474
_08059A5E:
	lsls r0, r1, #2
	ldr r1, _08059A70 @ =_08059A74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08059A68: .4byte 0x03004F9C
_08059A6C: .4byte 0x02000000
_08059A70: .4byte _08059A74
_08059A74: @ jump table
	.4byte _0805A474 @ case 0
	.4byte _08059C64 @ case 1
	.4byte _08059CC0 @ case 2
	.4byte _08059CD4 @ case 3
	.4byte _08059D10 @ case 4
	.4byte _08059D94 @ case 5
	.4byte _08059DF8 @ case 6
	.4byte _08059E28 @ case 7
	.4byte _08059F02 @ case 8
	.4byte _08059F02 @ case 9
	.4byte _08059F02 @ case 10
	.4byte _08059F02 @ case 11
	.4byte _08059F02 @ case 12
	.4byte _08059F9C @ case 13
	.4byte _0805A474 @ case 14
	.4byte _0805A474 @ case 15
	.4byte _0805A474 @ case 16
	.4byte _0805A474 @ case 17
	.4byte _0805A474 @ case 18
	.4byte _0805A148 @ case 19
	.4byte _0805A178 @ case 20
	.4byte _0805A18C @ case 21
	.4byte _0805A474 @ case 22
	.4byte _0805A474 @ case 23
	.4byte _0805A1A0 @ case 24
	.4byte _0805A440 @ case 25
	.4byte _0805A1D4 @ case 26
	.4byte _0805A440 @ case 27
	.4byte _0805A440 @ case 28
	.4byte _0805A440 @ case 29
	.4byte _0805A440 @ case 30
	.4byte _0805A440 @ case 31
	.4byte _0805A440 @ case 32
	.4byte _0805A440 @ case 33
	.4byte _0805A440 @ case 34
	.4byte _0805A440 @ case 35
	.4byte _0805A440 @ case 36
	.4byte _0805A440 @ case 37
	.4byte _0805A254 @ case 38
	.4byte _0805A26A @ case 39
	.4byte _0805A440 @ case 40
	.4byte _0805A440 @ case 41
	.4byte _0805A440 @ case 42
	.4byte _0805A440 @ case 43
	.4byte _0805A280 @ case 44
	.4byte _0805A294 @ case 45
	.4byte _0805A2DE @ case 46
	.4byte _0805A2F4 @ case 47
	.4byte _0805A30A @ case 48
	.4byte _0805A320 @ case 49
	.4byte _0805A336 @ case 50
	.4byte _0805A440 @ case 51
	.4byte _0805A440 @ case 52
	.4byte _0805A440 @ case 53
	.4byte _0805A440 @ case 54
	.4byte _0805A440 @ case 55
	.4byte _0805A440 @ case 56
	.4byte _0805A34C @ case 57
	.4byte _0805A440 @ case 58
	.4byte _0805A474 @ case 59
	.4byte _0805A440 @ case 60
	.4byte _0805A372 @ case 61
	.4byte _0805A440 @ case 62
	.4byte _0805A440 @ case 63
	.4byte _0805A440 @ case 64
	.4byte _0805A440 @ case 65
	.4byte _0805A440 @ case 66
	.4byte _0805A440 @ case 67
	.4byte _0805A440 @ case 68
	.4byte _0805A440 @ case 69
	.4byte _0805A440 @ case 70
	.4byte _0805A3A4 @ case 71
	.4byte _0805A440 @ case 72
	.4byte _0805A440 @ case 73
	.4byte _0805A440 @ case 74
	.4byte _0805A440 @ case 75
	.4byte _0805A440 @ case 76
	.4byte _0805A440 @ case 77
	.4byte _0805A3AC @ case 78
	.4byte _0805A440 @ case 79
	.4byte _0805A474 @ case 80
	.4byte _0805A3B4 @ case 81
	.4byte _0805A3D8 @ case 82
	.4byte _0805A474 @ case 83
	.4byte _0805A474 @ case 84
	.4byte _0805A474 @ case 85
	.4byte _0805A440 @ case 86
	.4byte _0805A440 @ case 87
	.4byte _0805A440 @ case 88
	.4byte _0805A440 @ case 89
	.4byte _0805A440 @ case 90
	.4byte _0805A440 @ case 91
	.4byte _0805A440 @ case 92
	.4byte _0805A440 @ case 93
	.4byte _0805A440 @ case 94
	.4byte _0805A440 @ case 95
	.4byte _0805A440 @ case 96
	.4byte _0805A440 @ case 97
	.4byte _0805A440 @ case 98
	.4byte _0805A440 @ case 99
	.4byte _0805A440 @ case 100
	.4byte _0805A440 @ case 101
	.4byte _0805A440 @ case 102
	.4byte _0805A440 @ case 103
	.4byte _0805A440 @ case 104
	.4byte _0805A474 @ case 105
	.4byte _0805A440 @ case 106
	.4byte _0805A440 @ case 107
	.4byte _0805A440 @ case 108
	.4byte _0805A440 @ case 109
	.4byte _0805A440 @ case 110
	.4byte _0805A440 @ case 111
	.4byte _0805A440 @ case 112
	.4byte _0805A44E @ case 113
	.4byte _0805A462 @ case 114
	.4byte _0805A440 @ case 115
	.4byte _0805A440 @ case 116
	.4byte _0805A440 @ case 117
	.4byte _0805A440 @ case 118
	.4byte _0805A440 @ case 119
	.4byte _0805A440 @ case 120
	.4byte _0805A440 @ case 121
	.4byte _0805A440 @ case 122
	.4byte _0805A440 @ case 123
_08059C64:
	ldr r0, _08059C74 @ =0x02000024
	ldr r0, [r0]
	cmp r0, #1
	bne _08059C78
	ldr r0, [r7, #0x24]
	str r0, [r7, #0x20]
	bl _0805A474
	.align 2, 0
_08059C74: .4byte 0x02000024
_08059C78:
	ldrh r1, [r7, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08059C84
	b _0805A42E
_08059C84:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08059C90
	bl _0805A474
_08059C90:
	bl CheckEkrHitDone
	cmp r0, #1
	beq _08059C9C
	bl _0805A474
_08059C9C:
	ldrh r1, [r7, #0x10]
	ldr r0, _08059CBC @ =0x0000FFF2
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	bl Get0201FAC8
	cmp r0, #0
	bne _08059CB4
	b _0805A474
_08059CB4:
	movs r0, #0
	bl Set0201FAC8
	b _0805A474
	.align 2, 0
_08059CBC: .4byte 0x0000FFF2
_08059CC0:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08059CCC
	b _0805A474
_08059CCC:
	ldr r0, _08059CD0 @ =0x0000FFFE
	b _0805A42A
	.align 2, 0
_08059CD0: .4byte 0x0000FFFE
_08059CD4:
	adds r0, r7, #0
	bl GetUnitEfxDebuff
	movs r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq _08059CEA
	adds r0, r7, #0
	movs r1, #0
	bl SetUnitEfxDebuff
_08059CEA:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08059D0C
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08059D0C
	adds r0, r7, #0
	bl NewEfxSpecalEffect
_08059D0C:
	ldrh r1, [r7, #0x10]
	b _0805A41C
_08059D10:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08059D26
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_08059D26:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08059D32
	b _0805A474
_08059D32:
	ldr r1, _08059D8C @ =0x0000FFDF
	ands r1, r2
	ldr r0, _08059D90 @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r5, #9
	movs r6, #0
	orrs r1, r5
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl sub_805B0B4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r4, r8
	adds r0, r4, #0
	bl sub_805AF28
	ldr r2, [sp]
	cmp r0, #1
	beq _08059D6E
	b _0805A474
_08059D6E:
	cmp r2, #0
	bne _08059D74
	b _0805A474
_08059D74:
	ldrh r0, [r2, #0x10]
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISLayerId
	cmp r0, #0
	beq _08059D88
	b _0805A474
_08059D88:
	adds r0, r4, #0
	b _08059F8C
	.align 2, 0
_08059D8C: .4byte 0x0000FFDF
_08059D90: .4byte 0x0000FFBF
_08059D94:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08059DAA
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_08059DAA:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08059DB6
	b _0805A474
_08059DB6:
	ldr r1, _08059DF0 @ =0x0000FFDF
	ands r1, r2
	ldr r0, _08059DF4 @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r0, #9
	orrs r1, r0
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08059DD6
	b _0805A474
_08059DD6:
	adds r0, r7, #0
	bl sub_805C170
	bl Get0201FAC8
	cmp r0, #0
	bne _08059DE6
	b _0805A474
_08059DE6:
	movs r0, #2
	bl Set0201FAC8
	b _0805A474
	.align 2, 0
_08059DF0: .4byte 0x0000FFDF
_08059DF4: .4byte 0x0000FFBF
_08059DF8:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	cmp r2, #0
	bne _08059E06
	b _0805A474
_08059E06:
	str r2, [sp]
	bl sub_805B0D8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp]
	cmp r8, r0
	bne _08059E1E
	b _0805A474
_08059E1E:
	ldrh r1, [r2, #0x10]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2, #0x10]
	b _0805A474
_08059E28:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08059E6C
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08059E54
	b _0805A41C
_08059E54:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08059EF4
	adds r0, r7, #0
	bl NewEfxSkillType01BG
	b _08059EF4
_08059E6C:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08059EB2
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08059E98
	b _0805A41C
_08059E98:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08059EF4
	adds r0, r7, #0
	movs r1, #1
	bl NewEfxSkillCommonBG
	b _08059EF4
_08059EB2:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08059EF4
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08059EDE
	b _0805A41C
_08059EDE:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08059EF4
	adds r0, r7, #0
	bl NewEfxSkillType01BG
_08059EF4:
	ldrh r1, [r7, #0x10]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08059F00
	b _0805A474
_08059F00:
	b _0805A41C
_08059F02:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _08059F0E
	b _0805A474
_08059F0E:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl sub_805B0B4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl sub_805AF28
	ldr r2, [sp]
	cmp r0, #0
	bne _08059F70
	adds r0, r2, #0
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r0, #2
	beq _08059F70
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _08059F66
	adds r0, r2, #0
	bl sub_807032C
	b _08059F6E
_08059F66:
	adds r0, r2, #0
	str r2, [sp]
	bl sub_806EA40
_08059F6E:
	ldr r2, [sp]
_08059F70:
	cmp r2, #0
	bne _08059F76
	b _0805A474
_08059F76:
	ldrh r1, [r2, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_805B0B4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_08059F8C:
	bl sub_805AF28
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	b _0805A474
_08059F9C:
	adds r0, r7, #0
	bl sub_805B094
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _08059FDC @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r6, [r0]
	ldrb r0, [r7, #0x12]
	ldr r2, [sp]
	cmp r0, #9
	bls _08059FD2
	b _0805A474
_08059FD2:
	lsls r0, r0, #2
	ldr r1, _08059FE0 @ =_08059FE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08059FDC: .4byte 0x02000000
_08059FE0: .4byte _08059FE4
_08059FE4: @ jump table
	.4byte _0805A00C @ case 0
	.4byte _0805A00C @ case 1
	.4byte _0805A00C @ case 2
	.4byte _0805A00C @ case 3
	.4byte _0805A110 @ case 4
	.4byte _0805A110 @ case 5
	.4byte _0805A11E @ case 6
	.4byte _0805A11E @ case 7
	.4byte _0805A11E @ case 8
	.4byte _0805A00C @ case 9
_0805A00C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _0805A016
	b _0805A110
_0805A016:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
	ldrh r0, [r2, #0x10]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r6, #0x10]
	orrs r1, r0
	strh r1, [r6, #0x10]
	ldr r1, _0805A06C @ =0x080DFF28
	ldr r0, _0805A070 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _0805A074 @ =0x080DFF00
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	ldr r2, [sp]
	cmp r0, #0
	bne _0805A07C
	ldr r0, _0805A078 @ =0x0200005C
	b _0805A07E
	.align 2, 0
_0805A06C: .4byte 0x080DFF28
_0805A070: .4byte 0x0203E11C
_0805A074: .4byte 0x080DFF00
_0805A078: .4byte 0x0200005C
_0805A07C:
	ldr r0, _0805A0FC @ =0x02000060
_0805A07E:
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #9
	ldr r0, _0805A100 @ =0x0200F1C8
	adds r1, r1, r0
	adds r1, r4, r1
	ldr r0, [r1, #4]
	ldr r2, [sp]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r6, #0x30]
	ldr r0, _0805A104 @ =0x000057F0
	adds r4, r4, r0
	str r4, [r6, #0x3c]
	ldr r4, _0805A108 @ =0x0203E1A0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [sp]
	cmp r0, #0
	bne _0805A132
	ldr r4, _0805A10C @ =0x0201FB1C
	adds r0, r2, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r2, [sp]
	ldr r0, [r2, #0x28]
	cmp r1, r0
	beq _0805A132
	adds r0, r2, #0
	bl sub_805A6B0
	ldr r2, [sp]
	adds r0, r2, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [sp]
	ldr r1, [r2, #0x28]
	str r1, [r0]
	b _0805A132
	.align 2, 0
_0805A0FC: .4byte 0x02000060
_0805A100: .4byte 0x0200F1C8
_0805A104: .4byte 0x000057F0
_0805A108: .4byte 0x0203E1A0
_0805A10C: .4byte 0x0201FB1C
_0805A110:
	ldr r1, _0805A140 @ =0x080DFF28
	ldr r0, _0805A144 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
_0805A11E:
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
_0805A132:
	adds r0, r2, #0
	bl AnimScrAdvance
	adds r0, r6, #0
	bl AnimScrAdvance
	b _0805A47E
	.align 2, 0
_0805A140: .4byte 0x080DFF28
_0805A144: .4byte 0x0203E11C
_0805A148:
	ldrh r2, [r7, #0x10]
	movs r1, #0x20
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _0805A15C
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r7, #0x10]
	b _0805A474
_0805A15C:
	ldr r1, _0805A170 @ =0x02017758
	ldr r0, [r1]
	cmp r0, #1
	beq _0805A166
	b _0805A474
_0805A166:
	movs r0, #0
	str r0, [r1]
	ldr r0, _0805A174 @ =0x0000FFDF
	ands r0, r2
	b _0805A42C
	.align 2, 0
_0805A170: .4byte 0x02017758
_0805A174: .4byte 0x0000FFDF
_0805A178:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A184
	b _0805A474
_0805A184:
	movs r0, #3
	bl sub_805441C
	b _0805A474
_0805A18C:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A198
	b _0805A474
_0805A198:
	movs r0, #0
	bl sub_805441C
	b _0805A474
_0805A1A0:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805A1AC
	b _0805A474
_0805A1AC:
	ldr r0, _0805A1CC @ =0x0000FFFE
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	ldrh r1, [r7, #8]
	ldr r0, _0805A1D0 @ =0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #8]
	movs r0, #0x8c
	b _0805A45A
	.align 2, 0
_0805A1CC: .4byte 0x0000FFFE
_0805A1D0: .4byte 0x0000F3FF
_0805A1D4:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A1E0
	b _0805A474
_0805A1E0:
	adds r0, r7, #0
	bl GetAnimAnotherSide
	adds r2, r0, #0
	cmp r2, #0
	beq _0805A212
	ldrh r1, [r2, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_805B0B4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl sub_805AF28
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r2, [sp]
_0805A212:
	adds r0, r2, #0
	str r2, [sp]
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0805A224
	b _0805A474
_0805A224:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _0805A24C
	adds r0, r2, #0
	bl sub_807032C
	b _0805A474
_0805A24C:
	adds r0, r7, #0
	bl sub_806EBA0
	b _0805A474
_0805A254:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A260
	b _0805A474
_0805A260:
	adds r0, r7, #0
	movs r1, #0
	bl sub_806EF84
	b _0805A474
_0805A26A:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A276
	b _0805A474
_0805A276:
	adds r0, r7, #0
	movs r1, #1
	bl sub_806EF84
	b _0805A474
_0805A280:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A28C
	b _0805A474
_0805A28C:
	adds r0, r7, #0
	bl sub_806F154
	b _0805A474
_0805A294:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	bne _0805A2B4
	b _0805A42E
_0805A2B4:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805A2C2
	b _0805A41C
_0805A2C2:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A2D4
	b _0805A474
_0805A2D4:
	adds r0, r7, #0
	movs r1, #0
	bl sub_80704AC
	b _0805A474
_0805A2DE:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A2EA
	b _0805A474
_0805A2EA:
	adds r0, r7, #0
	movs r1, #0
	bl sub_806F3A4
	b _0805A474
_0805A2F4:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A300
	b _0805A474
_0805A300:
	adds r0, r7, #0
	movs r1, #1
	bl sub_806F3A4
	b _0805A474
_0805A30A:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A316
	b _0805A474
_0805A316:
	adds r0, r7, #0
	movs r1, #0
	bl sub_806F63C
	b _0805A474
_0805A320:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A32C
	b _0805A474
_0805A32C:
	adds r0, r7, #0
	movs r1, #1
	bl sub_806F63C
	b _0805A474
_0805A336:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A342
	b _0805A474
_0805A342:
	adds r0, r7, #0
	movs r1, #2
	bl sub_806F63C
	b _0805A474
_0805A34C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805A41C
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq _0805A36A
	b _0805A474
_0805A36A:
	adds r0, r7, #0
	bl NewEfxKingPika
	b _0805A474
_0805A372:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805A380
	b _08059D0C
_0805A380:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A396
	movs r0, #1
	bl Set0201FAC8
_0805A396:
	adds r0, r7, #0
	bl sub_80705C8
	adds r0, r7, #0
	bl sub_80569E4
	b _08059D0C
_0805A3A4:
	adds r0, r7, #0
	bl sub_807004C
	b _0805A474
_0805A3AC:
	adds r0, r7, #0
	bl sub_806F88C
	b _0805A474
_0805A3B4:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805A41C
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A474
	adds r0, r7, #0
	bl NewEfxFlashFX
	b _0805A474
_0805A3D8:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	beq _0805A42E
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805A41C
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A474
	adds r0, r7, #0
	movs r1, #1
	bl sub_80704AC
	b _0805A474
_0805A41C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A474
	ldr r0, _0805A438 @ =0x0000FFDF
	ands r0, r1
	ldr r1, _0805A43C @ =0x0000FFBF
_0805A42A:
	ands r0, r1
_0805A42C:
	strh r0, [r7, #0x10]
_0805A42E:
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	b _0805A474
	.align 2, 0
_0805A438: .4byte 0x0000FFDF
_0805A43C: .4byte 0x0000FFBF
_0805A440:
	subs r0, r3, #1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl sub_8074050
	b _0805A474
_0805A44E:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A474
	movs r0, #0x14
_0805A45A:
	strh r0, [r7, #0xa]
	bl AnimSort
	b _0805A474
_0805A462:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A474
	movs r0, #0x64
	strh r0, [r7, #0xa]
	bl AnimSort
_0805A474:
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	bl _08059A40
_0805A47E:
	ldrh r1, [r7, #0xc]
	movs r0, #0xe7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r7, #0xc]

