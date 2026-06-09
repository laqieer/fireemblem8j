	.syntax unified
	.set GetAISLayerId, 0x0805AEF8 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundTypeFlags, 0x08059864 + 1
	.set GetEfxSoundType2FromBaseCon, 0x080748B8 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_807473C, 0x0807473C + 1
	.set sub_8074888, 0x08074888 + 1
	.set sub_80748E4, 0x080748E4 + 1
	.set sub_80749E0, 0x080749E0 + 1
	.set sub_8074DE8, 0x08074DE8 + 1
	.section .text.sub_8074050, "ax", %progbits
@ sub_8074050 @ JP 0x08074050 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074050
	.thumb_func
sub_8074050:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sl, r1
	bl GetAnimAnotherSide
	mov sb, r0
	mov r0, r8
	bl GetAISLayerId
	cmp r0, #1
	bne _08074072
	b _0807472C
_08074072:
	mov r0, r8
	bl GetAnimPosition
	adds r6, r0, #0
	cmp r6, #0
	bne _0807408C
	ldr r0, _08074088 @ =0x0203E1C8
	movs r1, #0
	ldrsh r5, [r0, r1]
	b _08074092
	.align 2, 0
_08074088: .4byte 0x0203E1C8
_0807408C:
	ldr r0, _080740BC @ =0x0203E1C8
	movs r2, #2
	ldrsh r5, [r0, r2]
_08074092:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl sub_807473C
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r5, #0x14
	bne _080740AE
	mov r0, r8
	bl sub_8074888
	cmp r0, #0
	bne _080740AE
	movs r4, #2
_080740AE:
	cmp r6, #0
	bne _080740C4
	ldr r0, _080740C0 @ =0x0203E1CC
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _080740CA
	.align 2, 0
_080740BC: .4byte 0x0203E1C8
_080740C0: .4byte 0x0203E1CC
_080740C4:
	ldr r0, _08074104 @ =0x0203E1CC
	movs r2, #2
	ldrsh r0, [r0, r2]
_080740CA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetEfxSoundType2FromBaseCon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r5, #1
	rsbs r5, r5, #0
	mov r0, r8
	bl sub_8074DE8
	mov r2, r8
	ldrh r1, [r2, #2]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	mov r0, sl
	subs r0, #0x19
	cmp r0, #0x62
	bls _080740FA
	b _0807470C
_080740FA:
	lsls r0, r0, #2
	ldr r1, _08074108 @ =_0807410C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08074104: .4byte 0x0203E1CC
_08074108: .4byte _0807410C
_0807410C: @ jump table
	.4byte _08074298 @ case 0
	.4byte _0807470C @ case 1
	.4byte _0807429C @ case 2
	.4byte _080742B0 @ case 3
	.4byte _080742C4 @ case 4
	.4byte _080742D8 @ case 5
	.4byte _080742EC @ case 6
	.4byte _08074358 @ case 7
	.4byte _080743C4 @ case 8
	.4byte _08074458 @ case 9
	.4byte _0807445C @ case 10
	.4byte _08074460 @ case 11
	.4byte _08074464 @ case 12
	.4byte _0807470C @ case 13
	.4byte _0807470C @ case 14
	.4byte _0807446C @ case 15
	.4byte _08074470 @ case 16
	.4byte _08074478 @ case 17
	.4byte _0807447E @ case 18
	.4byte _0807470C @ case 19
	.4byte _0807470C @ case 20
	.4byte _0807470C @ case 21
	.4byte _08074488 @ case 22
	.4byte _0807470C @ case 23
	.4byte _0807470C @ case 24
	.4byte _0807470C @ case 25
	.4byte _0807448E @ case 26
	.4byte _08074492 @ case 27
	.4byte _080744DC @ case 28
	.4byte _080744EC @ case 29
	.4byte _080744F0 @ case 30
	.4byte _080744F4 @ case 31
	.4byte _0807470C @ case 32
	.4byte _080744F8 @ case 33
	.4byte _08074500 @ case 34
	.4byte _08074506 @ case 35
	.4byte _0807470C @ case 36
	.4byte _08074518 @ case 37
	.4byte _0807451C @ case 38
	.4byte _08074522 @ case 39
	.4byte _0807452C @ case 40
	.4byte _08074530 @ case 41
	.4byte _08074534 @ case 42
	.4byte _0807453C @ case 43
	.4byte _08074542 @ case 44
	.4byte _0807454C @ case 45
	.4byte _0807470C @ case 46
	.4byte _08074554 @ case 47
	.4byte _08074558 @ case 48
	.4byte _08074560 @ case 49
	.4byte _08074566 @ case 50
	.4byte _08074570 @ case 51
	.4byte _08074578 @ case 52
	.4byte _0807470C @ case 53
	.4byte _08074580 @ case 54
	.4byte _08074588 @ case 55
	.4byte _0807470C @ case 56
	.4byte _0807470C @ case 57
	.4byte _0807470C @ case 58
	.4byte _0807470C @ case 59
	.4byte _0807470C @ case 60
	.4byte _0807458E @ case 61
	.4byte _08074598 @ case 62
	.4byte _080745A0 @ case 63
	.4byte _080745A8 @ case 64
	.4byte _080745BC @ case 65
	.4byte _080745C4 @ case 66
	.4byte _080745CC @ case 67
	.4byte _080745D2 @ case 68
	.4byte _080745E8 @ case 69
	.4byte _080745F0 @ case 70
	.4byte _080745F8 @ case 71
	.4byte _08074600 @ case 72
	.4byte _08074608 @ case 73
	.4byte _0807460E @ case 74
	.4byte _08074618 @ case 75
	.4byte _0807461E @ case 76
	.4byte _08074628 @ case 77
	.4byte _0807463C @ case 78
	.4byte _08074650 @ case 79
	.4byte _0807470C @ case 80
	.4byte _08074656 @ case 81
	.4byte _08074660 @ case 82
	.4byte _08074668 @ case 83
	.4byte _0807466E @ case 84
	.4byte _08074684 @ case 85
	.4byte _0807469C @ case 86
	.4byte _080746B4 @ case 87
	.4byte _0807470C @ case 88
	.4byte _0807470C @ case 89
	.4byte _080746CC @ case 90
	.4byte _080746D4 @ case 91
	.4byte _080746DC @ case 92
	.4byte _080746E4 @ case 93
	.4byte _080746EC @ case 94
	.4byte _080746F4 @ case 95
	.4byte _080746FA @ case 96
	.4byte _08074700 @ case 97
	.4byte _08074708 @ case 98
_08074298:
	movs r5, #0xd1
	b _0807470E
_0807429C:
	ldr r1, _080742AC @ =0x087A9254
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080742AC: .4byte 0x087A9254
_080742B0:
	ldr r1, _080742C0 @ =0x087A9270
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080742C0: .4byte 0x087A9270
_080742C4:
	ldr r1, _080742D4 @ =0x087A928C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080742D4: .4byte 0x087A928C
_080742D8:
	ldr r1, _080742E8 @ =0x087A92A8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080742E8: .4byte 0x087A92A8
_080742EC:
	mov r0, sb
	bl sub_80749E0
	mov r0, sb
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0807433A
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0807433A
	ldr r4, _08074354 @ =0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073E74
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8073F94
_0807433A:
	mov r0, sb
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _0807443A
	cmp r0, #1
	bgt _08074430
	cmp r0, #0
	bne _08074440
	movs r5, #0xd2
	b _08074440
	.align 2, 0
_08074354: .4byte 0x000003CF
_08074358:
	mov r0, sb
	bl sub_80749E0
	mov r0, sb
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _080743A6
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080743A6
	ldr r4, _080743C0 @ =0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073E74
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8073F94
_080743A6:
	mov r0, sb
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _0807443A
	cmp r0, #1
	bgt _08074430
	cmp r0, #0
	bne _08074440
	movs r5, #0xd3
	b _08074440
	.align 2, 0
_080743C0: .4byte 0x000003CF
_080743C4:
	mov r0, sb
	bl sub_80749E0
	mov r0, sb
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08074412
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08074412
	ldr r4, _0807442C @ =0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073E74
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8073F94
_08074412:
	mov r0, sb
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _0807443A
	cmp r0, #1
	bgt _08074430
	cmp r0, #0
	beq _08074436
	b _08074440
	.align 2, 0
_0807442C: .4byte 0x000003CF
_08074430:
	cmp r0, #2
	beq _0807443E
	b _08074440
_08074436:
	movs r5, #0xd4
	b _08074440
_0807443A:
	movs r5, #0xd5
	b _08074440
_0807443E:
	ldr r5, _08074454 @ =0x000002CE
_08074440:
	mov r0, sb
	bl sub_8074DE8
	mov r2, sb
	ldrh r1, [r2, #2]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	b _0807470E
	.align 2, 0
_08074454: .4byte 0x000002CE
_08074458:
	movs r5, #0xc9
	b _0807470E
_0807445C:
	movs r5, #0xc8
	b _0807470E
_08074460:
	movs r5, #0xca
	b _0807470E
_08074464:
	ldr r5, _08074468 @ =0x00000263
	b _080744DE
	.align 2, 0
_08074468: .4byte 0x00000263
_0807446C:
	movs r5, #0xf6
	b _0807470E
_08074470:
	ldr r5, _08074474 @ =0x00000141
	b _0807470E
	.align 2, 0
_08074474: .4byte 0x00000141
_08074478:
	movs r5, #0xa1
	lsls r5, r5, #1
	b _0807470E
_0807447E:
	ldr r5, _08074484 @ =0x00000267
	b _080744DE
	.align 2, 0
_08074484: .4byte 0x00000267
_08074488:
	movs r5, #0xbe
	lsls r5, r5, #2
	b _0807470E
_0807448E:
	movs r5, #0xe7
	b _0807470E
_08074492:
	cmp r6, #0
	beq _080744A4
	ldr r0, _080744A0 @ =0x0203E17E
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _080744AA
	.align 2, 0
_080744A0: .4byte 0x0203E17E
_080744A4:
	ldr r0, _080744C0 @ =0x0203E17E
	movs r1, #2
	ldrsh r0, [r0, r1]
_080744AA:
	cmp r0, #0xbf
	bgt _080744C8
	cmp r0, #0xbc
	blt _080744C8
	ldr r0, _080744C4 @ =0x087A9254
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r6, #4
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080744C0: .4byte 0x0203E17E
_080744C4: .4byte 0x087A9254
_080744C8:
	ldr r1, _080744D8 @ =0x087A9254
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080744D8: .4byte 0x087A9254
_080744DC:
	ldr r5, _080744E8 @ =0x00000265
_080744DE:
	cmp r6, #0
	beq _080744E4
	b _0807470E
_080744E4:
	subs r5, #1
	b _0807470E
	.align 2, 0
_080744E8: .4byte 0x00000265
_080744EC:
	movs r5, #0xce
	b _0807470E
_080744F0:
	movs r5, #0xcf
	b _0807470E
_080744F4:
	movs r5, #0xcb
	b _0807470E
_080744F8:
	ldr r5, _080744FC @ =0x000002D3
	b _0807470E
	.align 2, 0
_080744FC: .4byte 0x000002D3
_08074500:
	movs r5, #0xb5
	lsls r5, r5, #2
	b _0807470E
_08074506:
	ldr r5, _08074514 @ =0x00000263
	cmp r6, #0
	bne _0807450E
	subs r5, #1
_0807450E:
	movs r0, #0x80
	str r0, [sp]
	b _0807470E
	.align 2, 0
_08074514: .4byte 0x00000263
_08074518:
	movs r5, #0xf1
	b _0807470E
_0807451C:
	movs r5, #0x9b
	lsls r5, r5, #1
	b _0807470E
_08074522:
	ldr r5, _08074528 @ =0x00000117
	b _0807470E
	.align 2, 0
_08074528: .4byte 0x00000117
_0807452C:
	movs r5, #0xeb
	b _0807470E
_08074530:
	movs r5, #0xea
	b _0807470E
_08074534:
	ldr r5, _08074538 @ =0x000002CF
	b _0807470E
	.align 2, 0
_08074538: .4byte 0x000002CF
_0807453C:
	movs r5, #0xb4
	lsls r5, r5, #2
	b _0807470E
_08074542:
	ldr r5, _08074548 @ =0x000002D1
	b _0807470E
	.align 2, 0
_08074548: .4byte 0x000002D1
_0807454C:
	ldr r5, _08074550 @ =0x000002D2
	b _0807470E
	.align 2, 0
_08074550: .4byte 0x000002D2
_08074554:
	movs r5, #0xed
	b _0807470E
_08074558:
	ldr r5, _0807455C @ =0x00000135
	b _0807470E
	.align 2, 0
_0807455C: .4byte 0x00000135
_08074560:
	movs r5, #0x9a
	lsls r5, r5, #1
	b _0807470E
_08074566:
	ldr r5, _0807456C @ =0x000002DD
	b _0807470E
	.align 2, 0
_0807456C: .4byte 0x000002DD
_08074570:
	ldr r5, _08074574 @ =0x000002DE
	b _0807470E
	.align 2, 0
_08074574: .4byte 0x000002DE
_08074578:
	ldr r5, _0807457C @ =0x000002DF
	b _0807470E
	.align 2, 0
_0807457C: .4byte 0x000002DF
_08074580:
	ldr r5, _08074584 @ =0x000002F7
	b _0807470E
	.align 2, 0
_08074584: .4byte 0x000002F7
_08074588:
	movs r5, #0xba
	lsls r5, r5, #2
	b _0807470E
_0807458E:
	ldr r5, _08074594 @ =0x00000325
	b _0807470E
	.align 2, 0
_08074594: .4byte 0x00000325
_08074598:
	ldr r5, _0807459C @ =0x00000326
	b _0807470E
	.align 2, 0
_0807459C: .4byte 0x00000326
_080745A0:
	ldr r5, _080745A4 @ =0x00000327
	b _0807470E
	.align 2, 0
_080745A4: .4byte 0x00000327
_080745A8:
	ldr r1, _080745B8 @ =0x087A9334
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080745B8: .4byte 0x087A9334
_080745BC:
	ldr r5, _080745C0 @ =0x0000032A
	b _0807470E
	.align 2, 0
_080745C0: .4byte 0x0000032A
_080745C4:
	ldr r5, _080745C8 @ =0x0000032B
	b _0807470E
	.align 2, 0
_080745C8: .4byte 0x0000032B
_080745CC:
	movs r5, #0xcb
	lsls r5, r5, #2
	b _0807470E
_080745D2:
	ldr r1, _080745E4 @ =0x087A93C0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_080745E4: .4byte 0x087A93C0
_080745E8:
	ldr r5, _080745EC @ =0x0000032E
	b _0807470E
	.align 2, 0
_080745EC: .4byte 0x0000032E
_080745F0:
	ldr r5, _080745F4 @ =0x00000332
	b _0807470E
	.align 2, 0
_080745F4: .4byte 0x00000332
_080745F8:
	ldr r5, _080745FC @ =0x000003B7
	b _0807470E
	.align 2, 0
_080745FC: .4byte 0x000003B7
_08074600:
	ldr r5, _08074604 @ =0x0000032F
	b _0807470E
	.align 2, 0
_08074604: .4byte 0x0000032F
_08074608:
	movs r5, #0xcc
	lsls r5, r5, #2
	b _0807470E
_0807460E:
	ldr r5, _08074614 @ =0x00000331
	b _0807470E
	.align 2, 0
_08074614: .4byte 0x00000331
_08074618:
	movs r5, #0xc8
	lsls r5, r5, #2
	b _0807470E
_0807461E:
	ldr r5, _08074624 @ =0x00000321
	b _0807470E
	.align 2, 0
_08074624: .4byte 0x00000321
_08074628:
	ldr r1, _08074638 @ =0x087A944C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_08074638: .4byte 0x087A944C
_0807463C:
	ldr r1, _0807464C @ =0x087A94D8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08074678
	.align 2, 0
_0807464C: .4byte 0x087A94D8
_08074650:
	movs r5, #0xf0
	lsls r5, r5, #2
	b _0807470E
_08074656:
	ldr r5, _0807465C @ =0x000003C2
	b _0807470E
	.align 2, 0
_0807465C: .4byte 0x000003C2
_08074660:
	ldr r5, _08074664 @ =0x000003C3
	b _0807470E
	.align 2, 0
_08074664: .4byte 0x000003C3
_08074668:
	movs r5, #0xf1
	lsls r5, r5, #2
	b _0807470E
_0807466E:
	ldr r0, _08074680 @ =0x087A9254
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
_08074678:
	adds r0, r0, r1
	movs r1, #0
	ldrsh r5, [r0, r1]
	b _0807470E
	.align 2, 0
_08074680: .4byte 0x087A9254
_08074684:
	ldr r0, _08074698 @ =0x087A9254
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r1, #4
	ldrsh r5, [r0, r1]
	b _0807470E
	.align 2, 0
_08074698: .4byte 0x087A9254
_0807469C:
	ldr r0, _080746B0 @ =0x087A9254
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r1, #8
	ldrsh r5, [r0, r1]
	b _0807470E
	.align 2, 0
_080746B0: .4byte 0x087A9254
_080746B4:
	ldr r0, _080746C8 @ =0x087A9254
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r5, [r0, r1]
	b _0807470E
	.align 2, 0
_080746C8: .4byte 0x087A9254
_080746CC:
	ldr r5, _080746D0 @ =0x00000322
	b _0807470E
	.align 2, 0
_080746D0: .4byte 0x00000322
_080746D4:
	ldr r5, _080746D8 @ =0x0000037D
	b _0807470E
	.align 2, 0
_080746D8: .4byte 0x0000037D
_080746DC:
	ldr r5, _080746E0 @ =0x00000329
	b _0807470E
	.align 2, 0
_080746E0: .4byte 0x00000329
_080746E4:
	ldr r5, _080746E8 @ =0x0000037A
	b _0807470E
	.align 2, 0
_080746E8: .4byte 0x0000037A
_080746EC:
	ldr r5, _080746F0 @ =0x0000037B
	b _0807470E
	.align 2, 0
_080746F0: .4byte 0x0000037B
_080746F4:
	movs r5, #0xb9
	lsls r5, r5, #2
	b _0807470E
_080746FA:
	movs r5, #0xdf
	lsls r5, r5, #2
	b _0807470E
_08074700:
	ldr r5, _08074704 @ =0x0000037F
	b _0807470E
	.align 2, 0
_08074704: .4byte 0x0000037F
_08074708:
	movs r5, #0xde
	b _0807470E
_0807470C:
	movs r5, #0
_0807470E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0807472C
	adds r0, r5, #0
	ldr r1, [sp]
	str r2, [sp, #4]
	bl sub_8073E74
	adds r0, r5, #0
	ldr r2, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	bl sub_8073F94
_0807472C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

