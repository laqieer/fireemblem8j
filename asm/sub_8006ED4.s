	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set ClearTalkFlag, 0x080069CC + 1
	.set GetTalkPauseCmdDuration, 0x08008094 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetFaceBlinkControl, 0x0800633C + 1
	.set SetTalkFaceNoMouthMove, 0x080088C0 + 1
	.set SetTalkFlag, 0x080069AC + 1
	.set TalkHasCorrectBubble, 0x08008808 + 1
	.set Text_Skip, 0x08003D88 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003D80, 0x08003D80 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8005E3C, 0x08005E3C + 1
	.set sub_80063D8, 0x080063D8 + 1
	.set sub_8006DC8, 0x08006DC8 + 1
	.set sub_8006E04, 0x08006E04 + 1
	.set sub_800773C, 0x0800773C + 1
	.set sub_8007758, 0x08007758 + 1
	.set sub_80078E8, 0x080078E8 + 1
	.set sub_8007BD4, 0x08007BD4 + 1
	.set sub_8007CE4, 0x08007CE4 + 1
	.set sub_8008058, 0x08008058 + 1
	.set sub_80080A4, 0x080080A4 + 1
	.set sub_800814C, 0x0800814C + 1
	.set sub_8008A40, 0x08008A40 + 1
	.set sub_80142F0, 0x080142F0 + 1
	.set sub_8014328, 0x08014328 + 1
	.set sub_8031430, 0x08031430 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8006ED4, "ax", %progbits
@ sub_8006ED4 @ JP 0x08006ED4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006ED4
	.thumb_func
sub_8006ED4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
_08006EDE:
	ldr r7, _08006F14 @ =0x085B90D4
	adds r5, r7, #0
_08006EE2:
	ldr r1, [r5]
	ldr r4, [r1]
	ldrb r0, [r4]
	cmp r0, #0x14
	bgt _08006F18
	cmp r0, #0x12
	blt _08006F18
	adds r4, #1
	str r4, [r1]
	bl TalkHasCorrectBubble
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_8008A40
	adds r0, #7
	movs r1, #8
	bl sub_80D6374
	ldr r1, [r5]
	adds r0, #2
	strb r0, [r1, #0xe]
	b _08006EE2
	.align 2, 0
_08006F14: .4byte 0x085B90D4
_08006F18:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x81
	bls _08006F26
	bl _0800772C
_08006F26:
	lsls r0, r0, #2
	ldr r1, _08006F30 @ =_08006F34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006F30: .4byte _08006F34
_08006F34: @ jump table
	.4byte _0800719C @ case 0
	.4byte _080071B2 @ case 1
	.4byte _080071D0 @ case 2
	.4byte _08007218 @ case 3
	.4byte _08007254 @ case 4
	.4byte _08007254 @ case 5
	.4byte _08007254 @ case 6
	.4byte _08007254 @ case 7
	.4byte _08007354 @ case 8
	.4byte _08007354 @ case 9
	.4byte _08007354 @ case 10
	.4byte _08007354 @ case 11
	.4byte _08007354 @ case 12
	.4byte _08007354 @ case 13
	.4byte _08007354 @ case 14
	.4byte _08007354 @ case 15
	.4byte _080072B0 @ case 16
	.4byte _080072F0 @ case 17
	.4byte _0800772C @ case 18
	.4byte _0800772C @ case 19
	.4byte _0800772C @ case 20
	.4byte _08007288 @ case 21
	.4byte _08007298 @ case 22
	.4byte _080072A4 @ case 23
	.4byte _08007366 @ case 24
	.4byte _080073B0 @ case 25
	.4byte _080073FC @ case 26
	.4byte _08007448 @ case 27
	.4byte _08007334 @ case 28
	.4byte _08007344 @ case 29
	.4byte _0800772C @ case 30
	.4byte _0800772C @ case 31
	.4byte _0800772C @ case 32
	.4byte _0800772C @ case 33
	.4byte _0800772C @ case 34
	.4byte _0800772C @ case 35
	.4byte _0800772C @ case 36
	.4byte _0800772C @ case 37
	.4byte _0800772C @ case 38
	.4byte _0800772C @ case 39
	.4byte _0800772C @ case 40
	.4byte _0800772C @ case 41
	.4byte _0800772C @ case 42
	.4byte _0800772C @ case 43
	.4byte _0800772C @ case 44
	.4byte _0800772C @ case 45
	.4byte _0800772C @ case 46
	.4byte _0800772C @ case 47
	.4byte _0800772C @ case 48
	.4byte _0800772C @ case 49
	.4byte _0800772C @ case 50
	.4byte _0800772C @ case 51
	.4byte _0800772C @ case 52
	.4byte _0800772C @ case 53
	.4byte _0800772C @ case 54
	.4byte _0800772C @ case 55
	.4byte _0800772C @ case 56
	.4byte _0800772C @ case 57
	.4byte _0800772C @ case 58
	.4byte _0800772C @ case 59
	.4byte _0800772C @ case 60
	.4byte _0800772C @ case 61
	.4byte _0800772C @ case 62
	.4byte _0800772C @ case 63
	.4byte _0800772C @ case 64
	.4byte _0800772C @ case 65
	.4byte _0800772C @ case 66
	.4byte _0800772C @ case 67
	.4byte _0800772C @ case 68
	.4byte _0800772C @ case 69
	.4byte _0800772C @ case 70
	.4byte _0800772C @ case 71
	.4byte _0800772C @ case 72
	.4byte _0800772C @ case 73
	.4byte _0800772C @ case 74
	.4byte _0800772C @ case 75
	.4byte _0800772C @ case 76
	.4byte _0800772C @ case 77
	.4byte _0800772C @ case 78
	.4byte _0800772C @ case 79
	.4byte _0800772C @ case 80
	.4byte _0800772C @ case 81
	.4byte _0800772C @ case 82
	.4byte _0800772C @ case 83
	.4byte _0800772C @ case 84
	.4byte _0800772C @ case 85
	.4byte _0800772C @ case 86
	.4byte _0800772C @ case 87
	.4byte _0800772C @ case 88
	.4byte _0800772C @ case 89
	.4byte _0800772C @ case 90
	.4byte _0800772C @ case 91
	.4byte _0800772C @ case 92
	.4byte _0800772C @ case 93
	.4byte _0800772C @ case 94
	.4byte _0800772C @ case 95
	.4byte _0800772C @ case 96
	.4byte _0800772C @ case 97
	.4byte _0800772C @ case 98
	.4byte _0800772C @ case 99
	.4byte _0800772C @ case 100
	.4byte _0800772C @ case 101
	.4byte _0800772C @ case 102
	.4byte _0800772C @ case 103
	.4byte _0800772C @ case 104
	.4byte _0800772C @ case 105
	.4byte _0800772C @ case 106
	.4byte _0800772C @ case 107
	.4byte _0800772C @ case 108
	.4byte _0800772C @ case 109
	.4byte _0800772C @ case 110
	.4byte _0800772C @ case 111
	.4byte _0800772C @ case 112
	.4byte _0800772C @ case 113
	.4byte _0800772C @ case 114
	.4byte _0800772C @ case 115
	.4byte _0800772C @ case 116
	.4byte _0800772C @ case 117
	.4byte _0800772C @ case 118
	.4byte _0800772C @ case 119
	.4byte _0800772C @ case 120
	.4byte _0800772C @ case 121
	.4byte _0800772C @ case 122
	.4byte _0800772C @ case 123
	.4byte _0800772C @ case 124
	.4byte _0800772C @ case 125
	.4byte _0800772C @ case 126
	.4byte _0800772C @ case 127
	.4byte _08007494 @ case 128
	.4byte _0800713C @ case 129
_0800713C:
	ldr r2, [r7]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	cmp r0, #0x40
	beq _08007148
	b _0800772C
_08007148:
	adds r0, r1, #2
	str r0, [r2]
	ldrb r0, [r2, #9]
	ldrb r1, [r2, #0xb]
	adds r0, r0, r1
	ldrb r1, [r2, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08007194 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #6
	bl Text_Skip
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08007170
	b _08007264
_08007170:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08007264
	ldr r0, _08007198 @ =0x085B9168
	mov r1, r8
	bl Proc_StartBlocking
	adds r4, r0, #0
	movs r0, #4
	bl GetTalkPauseCmdDuration
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
_0800718E:
	movs r0, #3
	b _0800772E
	.align 2, 0
_08007194: .4byte 0x030000C8
_08007198: .4byte 0x085B9168
_0800719C:
	ldr r1, [r7]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _080071A8
_080071A4:
	movs r0, #0
	b _0800772E
_080071A8:
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	str r0, [r1, #4]
	b _08006EDE
_080071B2:
	ldr r1, [r7]
	ldrb r0, [r1, #0x15]
	cmp r0, #1
	beq _080071C0
	ldrb r0, [r1, #9]
	cmp r0, #1
	bne _080071C6
_080071C0:
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
_080071C6:
	ldr r1, [r7]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldr r1, [r7]
	b _0800725E
_080071D0:
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	beq _080071F0
	bl sub_8008058
	ldr r0, _080071EC @ =0x085B90D4
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _0800720C
	.align 2, 0
_080071EC: .4byte 0x085B90D4
_080071F0:
	movs r0, #1
	bl CheckTalkFlag
	cmp r0, #0
	bne _08007208
	ldr r0, _08007204 @ =0x085B9208
	mov r1, r8
	bl Proc_StartBlocking
	b _0800720C
	.align 2, 0
_08007204: .4byte 0x085B9208
_08007208:
	bl sub_800814C
_0800720C:
	ldr r0, _08007214 @ =0x085B90D4
	ldr r1, [r0]
	b _08007640
	.align 2, 0
_08007214: .4byte 0x085B90D4
_08007218:
	ldr r1, [r7]
	ldrb r0, [r1, #9]
	ldrb r2, [r1, #0xb]
	adds r0, r0, r2
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08007250 @ =0x030000C8
	adds r0, r0, r1
	bl sub_8003D80
	ldr r3, [r7]
	ldrb r1, [r3, #0xc]
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #4
	ldrb r2, [r3, #0xd]
	lsls r2, r2, #3
	ldrb r0, [r3, #9]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl sub_8007BD4
	b _0800763E
	.align 2, 0
_08007250: .4byte 0x030000C8
_08007254:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08007268
_0800725E:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_08007264:
	movs r0, #2
	b _0800772E
_08007268:
	ldr r0, _08007284 @ =0x085B9168
	mov r1, r8
	bl Proc_StartBlocking
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	bl GetTalkPauseCmdDuration
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	b _0800763E
	.align 2, 0
_08007284: .4byte 0x085B9168
_08007288:
	bl sub_80080A4
	ldr r0, _08007294 @ =0x085B90D4
	ldr r1, [r0]
	b _08007640
	.align 2, 0
_08007294: .4byte 0x085B90D4
_08007298:
	ldr r2, [r7]
	ldrb r1, [r2, #0x16]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0x16]
	b _0800763E
_080072A4:
	ldr r2, [r7]
	ldrb r1, [r2, #0x17]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0x17]
	b _0800763E
_080072B0:
	ldr r4, _080072C8 @ =0x085B90D4
_080072B2:
	ldr r2, [r4]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #8
	bge _080072BE
	b _0800718E
_080072BE:
	cmp r0, #0xf
	ble _080072CC
	cmp r0, #0x10
	beq _080072DC
	b _0800718E
	.align 2, 0
_080072C8: .4byte 0x085B90D4
_080072CC:
	subs r0, #8
	bl sub_800773C
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _080072B2
_080072DC:
	adds r0, r1, #1
	str r0, [r2]
	mov r0, r8
	bl sub_8007758
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	b _080072B2
_080072F0:
	bl TalkHasCorrectBubble
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080072FE
	bl sub_80080A4
_080072FE:
	ldr r4, _08007330 @ =0x085B90D4
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	lsls r1, r1, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8005E3C
	ldr r2, [r4]
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x18
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	mov r0, r8
	movs r1, #0x10
	bl sub_80142F0
	b _0800718E
	.align 2, 0
_08007330: .4byte 0x085B90D4
_08007334:
	movs r0, #0x10
	bl SetTalkFlag
	ldr r0, _08007340 @ =0x085B90D4
	ldr r1, [r0]
	b _08007640
	.align 2, 0
_08007340: .4byte 0x085B90D4
_08007344:
	movs r0, #0x10
	bl ClearTalkFlag
	ldr r0, _08007350 @ =0x085B90D4
	ldr r1, [r0]
	b _08007640
	.align 2, 0
_08007350: .4byte 0x085B90D4
_08007354:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #8
	b _0800763A
_08007366:
	ldr r6, _080073A4 @ =0x085B9228
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _080073A8 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _080073AC @ =0x02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_8007CE4
	b _0800763E
	.align 2, 0
_080073A4: .4byte 0x085B9228
_080073A8: .4byte 0x030000C8
_080073AC: .4byte 0x02022CA8
_080073B0:
	ldr r6, _080073F0 @ =0x085B9228
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _080073F4 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _080073F8 @ =0x02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_8007CE4
	b _0800763E
	.align 2, 0
_080073F0: .4byte 0x085B9228
_080073F4: .4byte 0x030000C8
_080073F8: .4byte 0x02022CA8
_080073FC:
	ldr r6, _0800743C @ =0x085B9238
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08007440 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _08007444 @ =0x02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_8007CE4
	b _0800763E
	.align 2, 0
_0800743C: .4byte 0x085B9238
_08007440: .4byte 0x030000C8
_08007444: .4byte 0x02022CA8
_08007448:
	ldr r6, _08007488 @ =0x085B9238
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _0800748C @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _08007490 @ =0x02022CA8
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_8007CE4
	b _0800763E
	.align 2, 0
_08007488: .4byte 0x085B9238
_0800748C: .4byte 0x030000C8
_08007490: .4byte 0x02022CA8
_08007494:
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #0x25
	bls _080074A4
	b _080071A4
_080074A4:
	lsls r0, r0, #2
	ldr r1, _080074B0 @ =_080074B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080074B0: .4byte _080074B4
_080074B4: @ jump table
	.4byte _08007570 @ case 0
	.4byte _08007570 @ case 1
	.4byte _08007570 @ case 2
	.4byte _08007570 @ case 3
	.4byte _080075C2 @ case 4
	.4byte _080075D4 @ case 5
	.4byte _0800760C @ case 6
	.4byte _0800763E @ case 7
	.4byte _0800763E @ case 8
	.4byte _080071A4 @ case 9
	.4byte _08007624 @ case 10
	.4byte _08007624 @ case 11
	.4byte _08007624 @ case 12
	.4byte _08007624 @ case 13
	.4byte _08007624 @ case 14
	.4byte _08007624 @ case 15
	.4byte _08007624 @ case 16
	.4byte _08007624 @ case 17
	.4byte _080071A4 @ case 18
	.4byte _080071A4 @ case 19
	.4byte _080071A4 @ case 20
	.4byte _080071A4 @ case 21
	.4byte _08007648 @ case 22
	.4byte _0800765E @ case 23
	.4byte _08007674 @ case 24
	.4byte _0800768A @ case 25
	.4byte _080076A0 @ case 26
	.4byte _080076B6 @ case 27
	.4byte _080076D0 @ case 28
	.4byte _080076E6 @ case 29
	.4byte _080076FC @ case 30
	.4byte _08007712 @ case 31
	.4byte _080075F4 @ case 32
	.4byte _0800755C @ case 33
	.4byte _080071A4 @ case 34
	.4byte _080071A4 @ case 35
	.4byte _0800754C @ case 36
	.4byte _080075B0 @ case 37
_0800754C:
	ldr r0, [r7]
	ldr r1, [r0, #0x38]
	cmp r1, #0
	beq _0800763E
	mov r0, r8
	bl sub_80D65C0
	b _0800763E
_0800755C:
	bl sub_8006E04
	ldr r0, _0800756C @ =0x085B90D4
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08006EDE
	.align 2, 0
_0800756C: .4byte 0x085B90D4
_08007570:
	ldr r3, _080075A8 @ =0x085B90D4
	ldr r1, [r3]
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r3]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _080075A2
	adds r6, r3, #0
	ldr r5, _080075AC @ =0x030000C8
_0800758C:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl sub_8003D90
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _0800758C
_080075A2:
	ldr r0, _080075A8 @ =0x085B90D4
	ldr r1, [r0]
	b _08007640
	.align 2, 0
_080075A8: .4byte 0x085B90D4
_080075AC: .4byte 0x030000C8
_080075B0:
	ldr r2, [r7]
	adds r2, #0x83
	ldrb r0, [r2]
	movs r1, #1
	ands r1, r0
	movs r0, #3
	subs r0, r0, r1
	strb r0, [r2]
	b _0800763E
_080075C2:
	mov r0, r8
	bl sub_8006DC8
	ldr r0, _080075D0 @ =0x085B90D4
	ldr r1, [r0]
	b _08007640
	.align 2, 0
_080075D0: .4byte 0x085B90D4
_080075D4:
	ldr r4, _080075F0 @ =0x085B90D4
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	adds r1, #0x40
	bl sub_8014328
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r1]
	b _08006EDE
	.align 2, 0
_080075F0: .4byte 0x085B90D4
_080075F4:
	ldr r4, _08007608 @ =0x085B90D4
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	bl sub_8031430
	ldr r1, [r4]
	str r0, [r1]
	b _08006EDE
	.align 2, 0
_08007608: .4byte 0x085B90D4
_0800760C:
	ldr r0, _08007620 @ =0x085B90D4
	ldr r1, [r0]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x60
	str r0, [r1]
	b _08006EDE
	.align 2, 0
_08007620: .4byte 0x085B90D4
_08007624:
	ldr r1, [r7]
	ldrb r0, [r1, #0x11]
	ldr r1, [r1]
	ldrb r1, [r1]
	subs r1, #0xa
	bl sub_80078E8
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0xa
_0800763A:
	bl sub_800773C
_0800763E:
	ldr r1, [r7]
_08007640:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _0800718E
_08007648:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _080076CA
_0800765E:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #1
	b _080076CA
_08007674:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _080076CA
_0800768A:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _080076CA
_080076A0:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
	b _080076CA
_080076B6:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #5
_080076CA:
	bl SetFaceBlinkControl
	b _0800718E
_080076D0:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08007726
_080076E6:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08007726
_080076FC:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08007726
_08007712:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
_08007726:
	bl sub_80063D8
	b _0800718E
_0800772C:
	movs r0, #1
_0800772E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

