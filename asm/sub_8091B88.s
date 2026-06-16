	.syntax unified
	.set ClearCgTextFlag, 0x08090CF0 + 1
	.set GetCgTextFlags, 0x08090D10 + 1
	.set GetFaceDisplayBitsById, 0x080056B0 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set SetFaceDisplayBitsById, 0x08005694 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.set sub_8007BD4, 0x08007BD4 + 1
	.set sub_8007C00, 0x08007C00 + 1
	.set sub_8030BE4, 0x08030BE4 + 1
	.set sub_809162C, 0x0809162C + 1
	.set sub_80923CC, 0x080923CC + 1
	.section .text.sub_8091B88, "ax", %progbits
@ CgTextInterpreter_Loop_Main @ JP 0x08091B88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CgTextInterpreter_Loop_Main
	.thumb_func
CgTextInterpreter_Loop_Main:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08091BC4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _08091BC8
	bl GetCgTextFlags
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08091BC8
	movs r0, #0x7f
	mov sl, r0
	b _08091BE2
	.align 2, 0
_08091BC4: .4byte 0x085775CC
_08091BC8:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _08091BDA
	b _08092174
_08091BDA:
	adds r0, r6, #0
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1]
_08091BE2:
	ldr r0, [r6, #0x30]
	bl SetTextFont
	ldr r0, _08091C14 @ =0x03005388
	ldrb r0, [r0]
	cmp r0, #0
	beq _08091C18
	cmp r0, #1
	beq _08091C32
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #1
	movs r1, #1
	bl SetFaceBlinkControlById
	b _08091C64
	.align 2, 0
_08091C14: .4byte 0x03005388
_08091C18:
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #1
	b _08091C4A
_08091C32:
	movs r0, #1
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #1
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #0
_08091C4A:
	movs r1, #1
	bl SetFaceBlinkControlById
	b _08091C64
_08091C52:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _08092148
_08091C64:
	movs r0, #0
	mov sb, r0
	cmp sb, sl
	blt _08091C6E
	b _08092148
_08091C6E:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _08091C7A
	b _080920BE
_08091C7A:
	lsls r0, r1, #2
	ldr r1, _08091C84 @ =_08091C88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091C84: .4byte _08091C88
_08091C88: @ jump table
	.4byte _08091F38 @ case 0
	.4byte _08091F66 @ case 1
	.4byte _08091FD6 @ case 2
	.4byte _0809201C @ case 3
	.4byte _08091F92 @ case 4
	.4byte _08091F9C @ case 5
	.4byte _08091FA6 @ case 6
	.4byte _08091FB0 @ case 7
	.4byte _080920BE @ case 8
	.4byte _080920BE @ case 9
	.4byte _080920BE @ case 10
	.4byte _080920BE @ case 11
	.4byte _080920BE @ case 12
	.4byte _080920BE @ case 13
	.4byte _080920BE @ case 14
	.4byte _080920BE @ case 15
	.4byte _080920BE @ case 16
	.4byte _080920BE @ case 17
	.4byte _080920BE @ case 18
	.4byte _080920BE @ case 19
	.4byte _080920BE @ case 20
	.4byte _080920BE @ case 21
	.4byte _08091FBA @ case 22
	.4byte _08091FC8 @ case 23
	.4byte _08091E8C @ case 24
	.4byte _08091EEC @ case 25
	.4byte _080920BE @ case 26
	.4byte _080920BE @ case 27
	.4byte _080920BE @ case 28
	.4byte _080920BE @ case 29
	.4byte _080920BE @ case 30
	.4byte _080920BE @ case 31
	.4byte _080920BE @ case 32
	.4byte _080920BE @ case 33
	.4byte _080920BE @ case 34
	.4byte _080920BE @ case 35
	.4byte _080920BE @ case 36
	.4byte _080920BE @ case 37
	.4byte _080920BE @ case 38
	.4byte _080920BE @ case 39
	.4byte _080920BE @ case 40
	.4byte _080920BE @ case 41
	.4byte _080920BE @ case 42
	.4byte _080920BE @ case 43
	.4byte _080920BE @ case 44
	.4byte _080920BE @ case 45
	.4byte _080920BE @ case 46
	.4byte _080920BE @ case 47
	.4byte _080920BE @ case 48
	.4byte _080920BE @ case 49
	.4byte _080920BE @ case 50
	.4byte _080920BE @ case 51
	.4byte _080920BE @ case 52
	.4byte _080920BE @ case 53
	.4byte _080920BE @ case 54
	.4byte _080920BE @ case 55
	.4byte _080920BE @ case 56
	.4byte _080920BE @ case 57
	.4byte _080920BE @ case 58
	.4byte _080920BE @ case 59
	.4byte _080920BE @ case 60
	.4byte _080920BE @ case 61
	.4byte _080920BE @ case 62
	.4byte _080920BE @ case 63
	.4byte _080920BE @ case 64
	.4byte _080920BE @ case 65
	.4byte _080920BE @ case 66
	.4byte _080920BE @ case 67
	.4byte _080920BE @ case 68
	.4byte _080920BE @ case 69
	.4byte _080920BE @ case 70
	.4byte _080920BE @ case 71
	.4byte _080920BE @ case 72
	.4byte _080920BE @ case 73
	.4byte _080920BE @ case 74
	.4byte _080920BE @ case 75
	.4byte _080920BE @ case 76
	.4byte _080920BE @ case 77
	.4byte _080920BE @ case 78
	.4byte _080920BE @ case 79
	.4byte _080920BE @ case 80
	.4byte _080920BE @ case 81
	.4byte _080920BE @ case 82
	.4byte _080920BE @ case 83
	.4byte _080920BE @ case 84
	.4byte _080920BE @ case 85
	.4byte _080920BE @ case 86
	.4byte _080920BE @ case 87
	.4byte _080920BE @ case 88
	.4byte _080920BE @ case 89
	.4byte _080920BE @ case 90
	.4byte _080920BE @ case 91
	.4byte _080920BE @ case 92
	.4byte _080920BE @ case 93
	.4byte _080920BE @ case 94
	.4byte _080920BE @ case 95
	.4byte _080920BE @ case 96
	.4byte _080920BE @ case 97
	.4byte _080920BE @ case 98
	.4byte _080920BE @ case 99
	.4byte _080920BE @ case 100
	.4byte _080920BE @ case 101
	.4byte _080920BE @ case 102
	.4byte _080920BE @ case 103
	.4byte _080920BE @ case 104
	.4byte _080920BE @ case 105
	.4byte _080920BE @ case 106
	.4byte _080920BE @ case 107
	.4byte _080920BE @ case 108
	.4byte _080920BE @ case 109
	.4byte _080920BE @ case 110
	.4byte _080920BE @ case 111
	.4byte _080920BE @ case 112
	.4byte _080920BE @ case 113
	.4byte _080920BE @ case 114
	.4byte _080920BE @ case 115
	.4byte _080920BE @ case 116
	.4byte _080920BE @ case 117
	.4byte _080920BE @ case 118
	.4byte _080920BE @ case 119
	.4byte _080920BE @ case 120
	.4byte _080920BE @ case 121
	.4byte _080920BE @ case 122
	.4byte _080920BE @ case 123
	.4byte _080920BE @ case 124
	.4byte _080920BE @ case 125
	.4byte _080920BE @ case 126
	.4byte _080920BE @ case 127
	.4byte _0809209E @ case 128
_08091E8C:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08091EE4 @ =0x08A73F14
	cmp r1, #0
	beq _08091EA8
	ldr r5, _08091EE8 @ =0x08A73F0C
_08091EA8:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r2, [r0]
	lsls r2, r2, #3
	adds r0, #1
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
_08091ECE:
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r5, #0
	bl sub_80923CC
_08091EDA:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _08092010
	.align 2, 0
_08091EE4: .4byte 0x08A73F14
_08091EE8: .4byte 0x08A73F0C
_08091EEC:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08091F30 @ =0x08A73F14
	cmp r1, #0
	beq _08091F08
	ldr r5, _08091F34 @ =0x08A73F0C
_08091F08:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r2, [r0]
	lsls r2, r2, #3
	adds r0, #1
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #2
	b _08091ECE
	.align 2, 0
_08091F30: .4byte 0x08A73F14
_08091F34: .4byte 0x08A73F0C
_08091F38:
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08091F54
	movs r0, #4
	bl ClearCgTextFlag
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _08091F5C
_08091F54:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_08091F5C:
	mov r0, r8
	movs r1, #0x63
	bl Proc_Goto
	b _08092010
_08091F66:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	adds r3, r6, #0
	adds r3, #0x54
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r2, #1
	adds r0, r6, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08091F8A
	b _08091C52
_08091F8A:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _0809213E
_08091F92:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #8
	strb r0, [r1]
	b _08091EDA
_08091F9C:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x10
	strb r0, [r1]
	b _08091EDA
_08091FA6:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x20
	strb r0, [r1]
	b _08091EDA
_08091FB0:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x80
	strb r0, [r1]
	b _08091EDA
_08091FBA:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldr r0, _08091FC4 @ =0x0000FFF7
	ands r7, r0
	b _0809213E
	.align 2, 0
_08091FC4: .4byte 0x0000FFF7
_08091FC8:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	movs r0, #8
	orrs r7, r0
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	b _0809213E
_08091FD6:
	adds r1, r2, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #1
	bne _08091FE4
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_08091FE4:
	bl GetCgTextFlags
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _08091FFA
	mov r0, r8
	movs r1, #2
	bl Proc_Goto
	b _08092010
_08091FFA:
	adds r0, r6, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r6, #0
	adds r1, #0x5f
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
_08092010:
	ldr r0, _08092018 @ =0x0000FFEF
	ands r7, r0
	b _08092148
	.align 2, 0
_08092018: .4byte 0x0000FFEF
_0809201C:
	ldr r0, _08092064 @ =0x0000FFEF
	ands r7, r0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08092068
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r5, r6, #0
	adds r5, #0x59
	lsls r1, r1, #3
	ldrb r0, [r5]
	adds r1, r1, r0
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r2, [r0]
	adds r4, r6, #0
	adds r4, #0x5a
	lsls r2, r2, #3
	ldrb r0, [r4]
	adds r2, r2, r0
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	bl sub_8007C00
	b _08092092
	.align 2, 0
_08092064: .4byte 0x0000FFEF
_08092068:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r5, r6, #0
	adds r5, #0x59
	lsls r1, r1, #3
	ldrb r0, [r5]
	adds r1, r1, r0
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r2, [r0]
	adds r4, r6, #0
	adds r4, #0x5a
	lsls r2, r2, #3
	ldrb r0, [r4]
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl sub_8007BD4
_08092092:
	adds r1, r5, #0
	adds r2, r4, #0
	ldr r0, [r6, #0x2c]
	bl sub_809162C
	b _08092148
_0809209E:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #0x21
	bne _080920B6
	adds r2, r6, #0
	adds r2, #0x5e
	ldrb r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2]
_080920B6:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0809213E
_080920BE:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _080920E2
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xc
	bl sub_8003D90
	b _080920FA
_080920E2:
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xb
	bl sub_8003D90
_080920FA:
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl sub_80040B8
	str r0, [r6, #0x2c]
	bl sub_8030BE4
	adds r4, r0, #0
	cmp r4, #1
	bne _08092120
	bl sub_8000CD8
	ands r0, r4
	cmp r0, #0
	beq _0809213E
_08092120:
	bl GetCgTextFlags
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0809213E
	ldr r0, _08092160 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809213E
	movs r0, #0x6e
	bl m4aSongNumStart
_0809213E:
	movs r0, #1
	add sb, r0
	cmp sb, sl
	bge _08092148
	b _08091C6E
_08092148:
	movs r0, #0
	bl SetTextFont
	ldr r0, _08092164 @ =0x03005388
	ldrb r0, [r0]
	cmp r0, #0
	beq _08092168
	cmp r0, #1
	beq _0809216C
	movs r0, #0
	b _0809216E
	.align 2, 0
_08092160: .4byte 0x0202BCEC
_08092164: .4byte 0x03005388
_08092168:
	movs r0, #0
	b _0809216E
_0809216C:
	movs r0, #1
_0809216E:
	adds r1, r7, #0
	bl SetFaceDisplayBitsById
_08092174:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

