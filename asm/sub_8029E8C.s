	.syntax unified
	.set CanUnitUseFruitItem, 0x080294AC + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set sub_8029150, 0x08029150 + 1
	.set sub_80293B4, 0x080293B4 + 1
	.section .text.sub_8029E8C, "ax", %progbits
@ sub_8029E8C @ JP 0x08029E8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029E8C
	.thumb_func
sub_8029E8C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08029EA2
	b _0802A08C
_08029EA2:
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x5b
	cmp r0, #0x66
	bls _08029EB0
	b _0802A08C
_08029EB0:
	lsls r0, r0, #2
	ldr r1, _08029EBC @ =_08029EC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08029EBC: .4byte _08029EC0
_08029EC0: @ jump table
	.4byte _0802A05C @ case 0
	.4byte _0802A05C @ case 1
	.4byte _0802A05C @ case 2
	.4byte _0802A05C @ case 3
	.4byte _0802A05C @ case 4
	.4byte _0802A05C @ case 5
	.4byte _0802A05C @ case 6
	.4byte _0802A05C @ case 7
	.4byte _0802A05C @ case 8
	.4byte _0802A066 @ case 9
	.4byte _0802A066 @ case 10
	.4byte _0802A066 @ case 11
	.4byte _0802A066 @ case 12
	.4byte _0802A066 @ case 13
	.4byte _0802A08C @ case 14
	.4byte _0802A08C @ case 15
	.4byte _0802A08C @ case 16
	.4byte _0802A08C @ case 17
	.4byte _0802A08C @ case 18
	.4byte _0802A08C @ case 19
	.4byte _0802A08C @ case 20
	.4byte _0802A08C @ case 21
	.4byte _0802A08C @ case 22
	.4byte _0802A08C @ case 23
	.4byte _0802A08C @ case 24
	.4byte _0802A08C @ case 25
	.4byte _0802A08C @ case 26
	.4byte _0802A08C @ case 27
	.4byte _0802A08C @ case 28
	.4byte _0802A08C @ case 29
	.4byte _0802A08C @ case 30
	.4byte _0802A08C @ case 31
	.4byte _0802A08C @ case 32
	.4byte _0802A08C @ case 33
	.4byte _0802A08C @ case 34
	.4byte _0802A08C @ case 35
	.4byte _0802A08C @ case 36
	.4byte _0802A08C @ case 37
	.4byte _0802A08C @ case 38
	.4byte _0802A08C @ case 39
	.4byte _0802A08C @ case 40
	.4byte _0802A08C @ case 41
	.4byte _0802A08C @ case 42
	.4byte _0802A08C @ case 43
	.4byte _0802A08C @ case 44
	.4byte _0802A066 @ case 45
	.4byte _0802A070 @ case 46
	.4byte _0802A066 @ case 47
	.4byte _0802A08C @ case 48
	.4byte _0802A08C @ case 49
	.4byte _0802A08C @ case 50
	.4byte _0802A08C @ case 51
	.4byte _0802A08C @ case 52
	.4byte _0802A08C @ case 53
	.4byte _0802A08C @ case 54
	.4byte _0802A08C @ case 55
	.4byte _0802A08C @ case 56
	.4byte _0802A08C @ case 57
	.4byte _0802A08C @ case 58
	.4byte _0802A08C @ case 59
	.4byte _0802A066 @ case 60
	.4byte _0802A066 @ case 61
	.4byte _0802A066 @ case 62
	.4byte _0802A08C @ case 63
	.4byte _0802A08C @ case 64
	.4byte _0802A08C @ case 65
	.4byte _0802A08C @ case 66
	.4byte _0802A08C @ case 67
	.4byte _0802A08C @ case 68
	.4byte _0802A08C @ case 69
	.4byte _0802A08C @ case 70
	.4byte _0802A08C @ case 71
	.4byte _0802A08C @ case 72
	.4byte _0802A08C @ case 73
	.4byte _0802A08C @ case 74
	.4byte _0802A08C @ case 75
	.4byte _0802A08C @ case 76
	.4byte _0802A08C @ case 77
	.4byte _0802A08C @ case 78
	.4byte _0802A08C @ case 79
	.4byte _0802A08C @ case 80
	.4byte _0802A08C @ case 81
	.4byte _0802A08C @ case 82
	.4byte _0802A08C @ case 83
	.4byte _0802A08C @ case 84
	.4byte _0802A08C @ case 85
	.4byte _0802A08C @ case 86
	.4byte _0802A08C @ case 87
	.4byte _0802A08C @ case 88
	.4byte _0802A08C @ case 89
	.4byte _0802A08C @ case 90
	.4byte _0802A08C @ case 91
	.4byte _0802A080 @ case 92
	.4byte _0802A08C @ case 93
	.4byte _0802A08C @ case 94
	.4byte _0802A08C @ case 95
	.4byte _0802A08C @ case 96
	.4byte _0802A08C @ case 97
	.4byte _0802A08C @ case 98
	.4byte _0802A08C @ case 99
	.4byte _0802A08C @ case 100
	.4byte _0802A08C @ case 101
	.4byte _0802A066 @ case 102
_0802A05C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80293B4
	b _0802A086
_0802A066:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8029150
	b _0802A086
_0802A070:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _0802A08C
	movs r0, #1
	b _0802A08E
_0802A080:
	adds r0, r5, #0
	bl CanUnitUseFruitItem
_0802A086:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802A08E
_0802A08C:
	movs r0, #0
_0802A08E:
	pop {r4, r5}
	pop {r1}
	bx r1

