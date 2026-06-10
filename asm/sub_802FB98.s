	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set StartBmPromotion, 0x080D1730 + 1
	.set sub_802EAD0, 0x0802EAD0 + 1
	.set sub_802EB58, 0x0802EB58 + 1
	.set sub_802EBC4, 0x0802EBC4 + 1
	.set sub_802EE30, 0x0802EE30 + 1
	.set sub_802EEE4, 0x0802EEE4 + 1
	.set sub_802EF48, 0x0802EF48 + 1
	.set sub_802F08C, 0x0802F08C + 1
	.set sub_802F104, 0x0802F104 + 1
	.set sub_802F1A0, 0x0802F1A0 + 1
	.set sub_802F1E0, 0x0802F1E0 + 1
	.set sub_802F238, 0x0802F238 + 1
	.set sub_802F2A0, 0x0802F2A0 + 1
	.set sub_802F304, 0x0802F304 + 1
	.set sub_802F370, 0x0802F370 + 1
	.set sub_802F3AC, 0x0802F3AC + 1
	.set sub_802F3F0, 0x0802F3F0 + 1
	.set sub_802F430, 0x0802F430 + 1
	.set sub_802F860, 0x0802F860 + 1
	.set sub_802F92C, 0x0802F92C + 1
	.set sub_802F99C, 0x0802F99C + 1
	.set sub_802F9E0, 0x0802F9E0 + 1
	.set sub_802FAD8, 0x0802FAD8 + 1
	.set sub_802FB0C, 0x0802FB0C + 1
	.section .text.sub_802FB98, "ax", %progbits
@ sub_802FB98 @ JP 0x0802FB98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FB98
	.thumb_func
sub_802FB98:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _0802FBD4 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	mov r8, r0
	ldr r0, _0802FBD8 @ =0x0203A4E8
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	mov r0, r8
	subs r0, #0x4b
	cmp r0, #0x76
	bls _0802FBCA
	b _0802FEC6
_0802FBCA:
	lsls r0, r0, #2
	ldr r1, _0802FBDC @ =_0802FBE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802FBD4: .4byte 0x0203A954
_0802FBD8: .4byte 0x0203A4E8
_0802FBDC: .4byte _0802FBE0
_0802FBE0: @ jump table
	.4byte _0802FDBC @ case 0
	.4byte _0802FDBC @ case 1
	.4byte _0802FDBC @ case 2
	.4byte _0802FDBC @ case 3
	.4byte _0802FDD4 @ case 4
	.4byte _0802FDDC @ case 5
	.4byte _0802FDC4 @ case 6
	.4byte _0802FDC4 @ case 7
	.4byte _0802FDC4 @ case 8
	.4byte _0802FDF4 @ case 9
	.4byte _0802FDE4 @ case 10
	.4byte _0802FEB0 @ case 11
	.4byte _0802FE04 @ case 12
	.4byte _0802FDFC @ case 13
	.4byte _0802FDEC @ case 14
	.4byte _0802FEC6 @ case 15
	.4byte _0802FE90 @ case 16
	.4byte _0802FE90 @ case 17
	.4byte _0802FE90 @ case 18
	.4byte _0802FE90 @ case 19
	.4byte _0802FE90 @ case 20
	.4byte _0802FE90 @ case 21
	.4byte _0802FE90 @ case 22
	.4byte _0802FE90 @ case 23
	.4byte _0802FE90 @ case 24
	.4byte _0802FE3C @ case 25
	.4byte _0802FE3C @ case 26
	.4byte _0802FE3C @ case 27
	.4byte _0802FE3C @ case 28
	.4byte _0802FE3C @ case 29
	.4byte _0802FE36 @ case 30
	.4byte _0802FE36 @ case 31
	.4byte _0802FE36 @ case 32
	.4byte _0802FE14 @ case 33
	.4byte _0802FE1E @ case 34
	.4byte _0802FE26 @ case 35
	.4byte _0802FE2E @ case 36
	.4byte _0802FE0C @ case 37
	.4byte _0802FEC6 @ case 38
	.4byte _0802FEC6 @ case 39
	.4byte _0802FEC6 @ case 40
	.4byte _0802FEC6 @ case 41
	.4byte _0802FEC6 @ case 42
	.4byte _0802FEC6 @ case 43
	.4byte _0802FEC6 @ case 44
	.4byte _0802FEC6 @ case 45
	.4byte _0802FE36 @ case 46
	.4byte _0802FEA0 @ case 47
	.4byte _0802FEA8 @ case 48
	.4byte _0802FEC6 @ case 49
	.4byte _0802FEB8 @ case 50
	.4byte _0802FEB8 @ case 51
	.4byte _0802FEB8 @ case 52
	.4byte _0802FEB8 @ case 53
	.4byte _0802FEC6 @ case 54
	.4byte _0802FEC6 @ case 55
	.4byte _0802FEC6 @ case 56
	.4byte _0802FEC6 @ case 57
	.4byte _0802FEC6 @ case 58
	.4byte _0802FEC6 @ case 59
	.4byte _0802FEC6 @ case 60
	.4byte _0802FE3C @ case 61
	.4byte _0802FE90 @ case 62
	.4byte _0802FE3C @ case 63
	.4byte _0802FEC6 @ case 64
	.4byte _0802FE98 @ case 65
	.4byte _0802FEC6 @ case 66
	.4byte _0802FEC6 @ case 67
	.4byte _0802FEC6 @ case 68
	.4byte _0802FEC6 @ case 69
	.4byte _0802FEC6 @ case 70
	.4byte _0802FEC6 @ case 71
	.4byte _0802FEC6 @ case 72
	.4byte _0802FEC6 @ case 73
	.4byte _0802FEC6 @ case 74
	.4byte _0802FEC6 @ case 75
	.4byte _0802FE3C @ case 76
	.4byte _0802FE3C @ case 77
	.4byte _0802FE3C @ case 78
	.4byte _0802FEC6 @ case 79
	.4byte _0802FEC6 @ case 80
	.4byte _0802FEC6 @ case 81
	.4byte _0802FEC6 @ case 82
	.4byte _0802FEC6 @ case 83
	.4byte _0802FEC6 @ case 84
	.4byte _0802FEC6 @ case 85
	.4byte _0802FEC6 @ case 86
	.4byte _0802FE14 @ case 87
	.4byte _0802FEC6 @ case 88
	.4byte _0802FEC6 @ case 89
	.4byte _0802FEC6 @ case 90
	.4byte _0802FDCC @ case 91
	.4byte _0802FEC6 @ case 92
	.4byte _0802FEC6 @ case 93
	.4byte _0802FEC6 @ case 94
	.4byte _0802FEC6 @ case 95
	.4byte _0802FEC6 @ case 96
	.4byte _0802FEC6 @ case 97
	.4byte _0802FEC6 @ case 98
	.4byte _0802FEC6 @ case 99
	.4byte _0802FEC6 @ case 100
	.4byte _0802FEC6 @ case 101
	.4byte _0802FEC6 @ case 102
	.4byte _0802FEC6 @ case 103
	.4byte _0802FEC6 @ case 104
	.4byte _0802FEC6 @ case 105
	.4byte _0802FEC6 @ case 106
	.4byte _0802FEC6 @ case 107
	.4byte _0802FEC0 @ case 108
	.4byte _0802FEC6 @ case 109
	.4byte _0802FEC6 @ case 110
	.4byte _0802FEC6 @ case 111
	.4byte _0802FEC6 @ case 112
	.4byte _0802FEC6 @ case 113
	.4byte _0802FEC6 @ case 114
	.4byte _0802FEC6 @ case 115
	.4byte _0802FEC6 @ case 116
	.4byte _0802FEC6 @ case 117
	.4byte _0802FE3C @ case 118
_0802FDBC:
	adds r0, r6, #0
	bl sub_802EAD0
	b _0802FEC6
_0802FDC4:
	adds r0, r6, #0
	bl sub_802EF48
	b _0802FEC6
_0802FDCC:
	adds r0, r6, #0
	bl sub_802F104
	b _0802FEC6
_0802FDD4:
	adds r0, r6, #0
	bl sub_802F08C
	b _0802FEC6
_0802FDDC:
	adds r0, r6, #0
	bl sub_802EB58
	b _0802FEC6
_0802FDE4:
	adds r0, r6, #0
	bl sub_802EE30
	b _0802FEC6
_0802FDEC:
	adds r0, r6, #0
	bl sub_802EBC4
	b _0802FEC6
_0802FDF4:
	adds r0, r6, #0
	bl sub_802EEE4
	b _0802FEC6
_0802FDFC:
	adds r0, r6, #0
	bl sub_802F1A0
	b _0802FEC6
_0802FE04:
	adds r0, r6, #0
	bl sub_802F1E0
	b _0802FEC6
_0802FE0C:
	adds r0, r6, #0
	bl sub_802F3AC
	b _0802FEC6
_0802FE14:
	adds r0, r6, #0
	movs r1, #0xa
	bl sub_802F2A0
	b _0802FEC6
_0802FE1E:
	adds r0, r6, #0
	bl sub_802F304
	b _0802FEC6
_0802FE26:
	adds r0, r6, #0
	bl sub_802F370
	b _0802FEC6
_0802FE2E:
	adds r0, r6, #0
	bl sub_802F3F0
	b _0802FEC6
_0802FE36:
	bl sub_802F430
	b _0802FEC6
_0802FE3C:
	ldr r4, _0802FE84 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r5, _0802FE88 @ =0x0203A4E8
	ldr r7, _0802FE8C @ =0x0203A568
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r2, r7, #0
	adds r2, #0x4a
	strh r1, [r2]
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitEquippedWeapon
	adds r1, r7, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r5, #0x48
	strh r0, [r5]
	adds r1, #0x27
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl StartBmPromotion
	b _0802FEC6
	.align 2, 0
_0802FE84: .4byte 0x0203A954
_0802FE88: .4byte 0x0203A4E8
_0802FE8C: .4byte 0x0203A568
_0802FE90:
	adds r0, r6, #0
	bl sub_802F860
	b _0802FEC6
_0802FE98:
	adds r0, r6, #0
	bl sub_802F238
	b _0802FEC6
_0802FEA0:
	adds r0, r6, #0
	bl sub_802F99C
	b _0802FEC6
_0802FEA8:
	adds r0, r6, #0
	bl sub_802F9E0
	b _0802FEC6
_0802FEB0:
	adds r0, r6, #0
	bl sub_802FAD8
	b _0802FEC6
_0802FEB8:
	adds r0, r6, #0
	bl sub_802FB0C
	b _0802FEC6
_0802FEC0:
	adds r0, r6, #0
	bl sub_802F92C
_0802FEC6:
	mov r0, r8
	cmp r0, #0xa6
	bne _0802FEDC
	ldr r0, _0802FED8 @ =0x085C4308
	adds r1, r6, #0
	bl Proc_StartBlocking
	b _0802FEF2
	.align 2, 0
_0802FED8: .4byte 0x085C4308
_0802FEDC:
	ldr r0, _0802FEFC @ =0x0203A568
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0802FEF2
	ldr r0, _0802FF00 @ =0x085C42F0
	adds r1, r6, #0
	bl Proc_StartBlocking
_0802FEF2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FEFC: .4byte 0x0203A568
_0802FF00: .4byte 0x085C42F0

