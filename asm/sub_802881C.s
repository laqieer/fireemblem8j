	.syntax unified
	.set CanUnitUseAntitoxinItem, 0x0802908C + 1
	.set CanUnitUseFruitItem, 0x080294AC + 1
	.set CanUnitUseLockpickItem, 0x08029108 + 1
	.set CanUnitUsePureWaterItem, 0x08029048 + 1
	.set CanUnitUseStaff, 0x0801654C + 1
	.set CanUnitUseTorchItem, 0x08029060 + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set sub_8029010, 0x08029010 + 1
	.set sub_8029024, 0x08029024 + 1
	.set sub_80290A4, 0x080290A4 + 1
	.set sub_80290E0, 0x080290E0 + 1
	.set sub_8029150, 0x08029150 + 1
	.set sub_80293B4, 0x080293B4 + 1
	.section .text.sub_802881C, "ax", %progbits
@ sub_802881C @ JP 0x0802881C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802881C
	.thumb_func
sub_802881C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08028840
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028840
	b _08028BB0
_08028840:
	adds r0, r5, #0
	bl GetItemIndex
	subs r0, #0x4b
	cmp r0, #0x76
	bls _0802884E
	b _08028BB0
_0802884E:
	lsls r0, r0, #2
	ldr r1, _08028858 @ =_0802885C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028858: .4byte _0802885C
_0802885C: @ jump table
	.4byte _08028A38 @ case 0
	.4byte _08028A38 @ case 1
	.4byte _08028A38 @ case 2
	.4byte _08028A48 @ case 3
	.4byte _08028A58 @ case 4
	.4byte _08028A68 @ case 5
	.4byte _08028A98 @ case 6
	.4byte _08028AA8 @ case 7
	.4byte _08028AB8 @ case 8
	.4byte _08028AC8 @ case 9
	.4byte _08028A78 @ case 10
	.4byte _08028B74 @ case 11
	.4byte _08028AD8 @ case 12
	.4byte _08028AE8 @ case 13
	.4byte _08028A88 @ case 14
	.4byte _08028BB0 @ case 15
	.4byte _08028AF8 @ case 16
	.4byte _08028AF8 @ case 17
	.4byte _08028AF8 @ case 18
	.4byte _08028AF8 @ case 19
	.4byte _08028AF8 @ case 20
	.4byte _08028AF8 @ case 21
	.4byte _08028AF8 @ case 22
	.4byte _08028AF8 @ case 23
	.4byte _08028AF8 @ case 24
	.4byte _08028B02 @ case 25
	.4byte _08028B02 @ case 26
	.4byte _08028B02 @ case 27
	.4byte _08028B02 @ case 28
	.4byte _08028B02 @ case 29
	.4byte _08028B2C @ case 30
	.4byte _08028B34 @ case 31
	.4byte _08028B3C @ case 32
	.4byte _08028B0C @ case 33
	.4byte _08028B0C @ case 34
	.4byte _08028B14 @ case 35
	.4byte _08028B24 @ case 36
	.4byte _08028B1C @ case 37
	.4byte _08028BB0 @ case 38
	.4byte _08028BB0 @ case 39
	.4byte _08028BB0 @ case 40
	.4byte _08028BB0 @ case 41
	.4byte _08028BB0 @ case 42
	.4byte _08028BB0 @ case 43
	.4byte _08028BB0 @ case 44
	.4byte _08028BB0 @ case 45
	.4byte _08028B2C @ case 46
	.4byte _08028B54 @ case 47
	.4byte _08028B64 @ case 48
	.4byte _08028BB0 @ case 49
	.4byte _08028B84 @ case 50
	.4byte _08028B84 @ case 51
	.4byte _08028B84 @ case 52
	.4byte _08028B84 @ case 53
	.4byte _08028BB0 @ case 54
	.4byte _08028BB0 @ case 55
	.4byte _08028BB0 @ case 56
	.4byte _08028BB0 @ case 57
	.4byte _08028BB0 @ case 58
	.4byte _08028BB0 @ case 59
	.4byte _08028BB0 @ case 60
	.4byte _08028B02 @ case 61
	.4byte _08028B94 @ case 62
	.4byte _08028B02 @ case 63
	.4byte _08028BB0 @ case 64
	.4byte _08028B44 @ case 65
	.4byte _08028BB0 @ case 66
	.4byte _08028BB0 @ case 67
	.4byte _08028BB0 @ case 68
	.4byte _08028BB0 @ case 69
	.4byte _08028BB0 @ case 70
	.4byte _08028BB0 @ case 71
	.4byte _08028BB0 @ case 72
	.4byte _08028BB0 @ case 73
	.4byte _08028BB0 @ case 74
	.4byte _08028BB0 @ case 75
	.4byte _08028B02 @ case 76
	.4byte _08028B02 @ case 77
	.4byte _08028B02 @ case 78
	.4byte _08028BB0 @ case 79
	.4byte _08028BB0 @ case 80
	.4byte _08028BB0 @ case 81
	.4byte _08028BB0 @ case 82
	.4byte _08028BB0 @ case 83
	.4byte _08028BB0 @ case 84
	.4byte _08028BB0 @ case 85
	.4byte _08028BB0 @ case 86
	.4byte _08028B0C @ case 87
	.4byte _08028BB0 @ case 88
	.4byte _08028BB0 @ case 89
	.4byte _08028BB0 @ case 90
	.4byte _08028BB0 @ case 91
	.4byte _08028BB0 @ case 92
	.4byte _08028BB0 @ case 93
	.4byte _08028BB0 @ case 94
	.4byte _08028BB0 @ case 95
	.4byte _08028BB0 @ case 96
	.4byte _08028BB0 @ case 97
	.4byte _08028BB0 @ case 98
	.4byte _08028BB0 @ case 99
	.4byte _08028BB0 @ case 100
	.4byte _08028BB0 @ case 101
	.4byte _08028BB0 @ case 102
	.4byte _08028BB0 @ case 103
	.4byte _08028BB0 @ case 104
	.4byte _08028BB0 @ case 105
	.4byte _08028BB0 @ case 106
	.4byte _08028BB0 @ case 107
	.4byte _08028BA4 @ case 108
	.4byte _08028BB0 @ case 109
	.4byte _08028BB0 @ case 110
	.4byte _08028BB0 @ case 111
	.4byte _08028BB0 @ case 112
	.4byte _08028BB0 @ case 113
	.4byte _08028BB0 @ case 114
	.4byte _08028BB0 @ case 115
	.4byte _08028BB0 @ case 116
	.4byte _08028BB0 @ case 117
	.4byte _08028B02 @ case 118
_08028A38:
	ldr r1, _08028A44 @ =sub_8025E20
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028A44: .4byte 0x08025E21  @ sub_8025E20
_08028A48:
	ldr r1, _08028A54 @ =sub_8025E54
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028A54: .4byte 0x08025E55  @ sub_8025E54
_08028A58:
	ldr r1, _08028A64 @ =sub_8025E54
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028A64: .4byte 0x08025E55  @ sub_8025E54
_08028A68:
	ldr r1, _08028A74 @ =sub_8025F8C
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028A74: .4byte 0x08025F8D  @ sub_8025F8C
_08028A78:
	ldr r1, _08028A84 @ =sub_802607C
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028A84: .4byte 0x0802607D  @ sub_802607C
_08028A88:
	ldr r1, _08028A94 @ =sub_8026010
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028A94: .4byte 0x08026011  @ sub_8026010
_08028A98:
	ldr r1, _08028AA4 @ =sub_8026188
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028AA4: .4byte 0x08026189  @ sub_8026188
_08028AA8:
	ldr r1, _08028AB4 @ =sub_80261B0
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028AB4: .4byte 0x080261B1  @ sub_80261B0
_08028AB8:
	ldr r1, _08028AC4 @ =sub_80261D8
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028AC4: .4byte 0x080261D9  @ sub_80261D8
_08028AC8:
	ldr r1, _08028AD4 @ =sub_8026238
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028AD4: .4byte 0x08026239  @ sub_8026238
_08028AD8:
	ldr r1, _08028AE4 @ =sub_80262F8
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028AE4: .4byte 0x080262F9  @ sub_80262F8
_08028AE8:
	ldr r1, _08028AF4 @ =sub_802626C
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028AF4: .4byte 0x0802626D  @ sub_802626C
_08028AF8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80293B4
	b _08028BAA
_08028B02:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8029150
	b _08028BAA
_08028B0C:
	adds r0, r4, #0
	bl sub_8029024
	b _08028BAA
_08028B14:
	adds r0, r4, #0
	bl CanUnitUsePureWaterItem
	b _08028BAA
_08028B1C:
	adds r0, r4, #0
	bl CanUnitUseTorchItem
	b _08028BAA
_08028B24:
	adds r0, r4, #0
	bl CanUnitUseAntitoxinItem
	b _08028BAA
_08028B2C:
	adds r0, r4, #0
	bl sub_80290A4
	b _08028BAA
_08028B34:
	adds r0, r4, #0
	bl sub_80290E0
	b _08028BAA
_08028B3C:
	adds r0, r4, #0
	bl CanUnitUseLockpickItem
	b _08028BAA
_08028B44:
	ldr r1, _08028B50 @ =sub_802632C
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028B50: .4byte 0x0802632D  @ sub_802632C
_08028B54:
	ldr r1, _08028B60 @ =sub_8026494
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028B60: .4byte 0x08026495  @ sub_8026494
_08028B64:
	ldr r1, _08028B70 @ =sub_8026524
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028B70: .4byte 0x08026525  @ sub_8026524
_08028B74:
	ldr r0, _08028B80 @ =0x0202BCEC
	ldrb r1, [r0, #0xd]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _08028BB2
	.align 2, 0
_08028B80: .4byte 0x0202BCEC
_08028B84:
	ldr r1, _08028B90 @ =sub_8026588
	adds r0, r4, #0
	bl sub_8029010
	b _08028BAA
	.align 2, 0
_08028B90: .4byte 0x08026589  @ sub_8026588
_08028B94:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _08028BB0
	movs r0, #1
	b _08028BB2
_08028BA4:
	adds r0, r4, #0
	bl CanUnitUseFruitItem
_08028BAA:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08028BB2
_08028BB0:
	movs r0, #0
_08028BB2:
	pop {r4, r5}
	pop {r1}
	bx r1

