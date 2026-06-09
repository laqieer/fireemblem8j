	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set sub_807AC60, 0x0807AC60 + 1
	.set sub_807B660, 0x0807B660 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_807B180, "ax", %progbits
@ sub_807B180 @ JP 0x0807B180 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B180
	.thumb_func
sub_807B180:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x41
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0807B1D4
	ldrb r0, [r4]
	cmp r0, #0x49
	bgt _0807B1B8
	cmp r0, #0x48
	bge _0807B1CC
	cmp r0, #0x24
	ble _0807B1AA
	b _0807B3D8
_0807B1AA:
	cmp r0, #0x1f
	bge _0807B1B0
	b _0807B3D8
_0807B1B0:
	ldr r5, _0807B1B4 @ =0x08A130B6
	b _0807B402
	.align 2, 0
_0807B1B4: .4byte 0x08A130B6
_0807B1B8:
	cmp r0, #0x60
	ble _0807B1BE
	b _0807B3D8
_0807B1BE:
	cmp r0, #0x5f
	bge _0807B1C4
	b _0807B3D8
_0807B1C4:
	ldr r5, _0807B1C8 @ =0x08A1317E
	b _0807B402
	.align 2, 0
_0807B1C8: .4byte 0x08A1317E
_0807B1CC:
	ldr r5, _0807B1D0 @ =0x08A130E2
	b _0807B402
	.align 2, 0
_0807B1D0: .4byte 0x08A130E2
_0807B1D4:
	ldrb r0, [r4]
	subs r0, #9
	cmp r0, #0x72
	bls _0807B1DE
	b _0807B400
_0807B1DE:
	lsls r0, r0, #2
	ldr r1, _0807B1E8 @ =_0807B1EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B1E8: .4byte _0807B1EC
_0807B1EC: @ jump table
	.4byte _0807B3E8 @ case 0
	.4byte _0807B3E8 @ case 1
	.4byte _0807B3E8 @ case 2
	.4byte _0807B3E8 @ case 3
	.4byte _0807B400 @ case 4
	.4byte _0807B400 @ case 5
	.4byte _0807B400 @ case 6
	.4byte _0807B400 @ case 7
	.4byte _0807B400 @ case 8
	.4byte _0807B400 @ case 9
	.4byte _0807B400 @ case 10
	.4byte _0807B400 @ case 11
	.4byte _0807B400 @ case 12
	.4byte _0807B400 @ case 13
	.4byte _0807B400 @ case 14
	.4byte _0807B400 @ case 15
	.4byte _0807B400 @ case 16
	.4byte _0807B400 @ case 17
	.4byte _0807B400 @ case 18
	.4byte _0807B400 @ case 19
	.4byte _0807B400 @ case 20
	.4byte _0807B400 @ case 21
	.4byte _0807B400 @ case 22
	.4byte _0807B400 @ case 23
	.4byte _0807B400 @ case 24
	.4byte _0807B400 @ case 25
	.4byte _0807B400 @ case 26
	.4byte _0807B400 @ case 27
	.4byte _0807B400 @ case 28
	.4byte _0807B400 @ case 29
	.4byte _0807B400 @ case 30
	.4byte _0807B400 @ case 31
	.4byte _0807B400 @ case 32
	.4byte _0807B400 @ case 33
	.4byte _0807B400 @ case 34
	.4byte _0807B400 @ case 35
	.4byte _0807B400 @ case 36
	.4byte _0807B400 @ case 37
	.4byte _0807B400 @ case 38
	.4byte _0807B400 @ case 39
	.4byte _0807B400 @ case 40
	.4byte _0807B400 @ case 41
	.4byte _0807B400 @ case 42
	.4byte _0807B400 @ case 43
	.4byte _0807B400 @ case 44
	.4byte _0807B400 @ case 45
	.4byte _0807B400 @ case 46
	.4byte _0807B400 @ case 47
	.4byte _0807B400 @ case 48
	.4byte _0807B400 @ case 49
	.4byte _0807B3E8 @ case 50
	.4byte _0807B3F8 @ case 51
	.4byte _0807B400 @ case 52
	.4byte _0807B400 @ case 53
	.4byte _0807B400 @ case 54
	.4byte _0807B400 @ case 55
	.4byte _0807B400 @ case 56
	.4byte _0807B400 @ case 57
	.4byte _0807B400 @ case 58
	.4byte _0807B400 @ case 59
	.4byte _0807B400 @ case 60
	.4byte _0807B400 @ case 61
	.4byte _0807B400 @ case 62
	.4byte _0807B400 @ case 63
	.4byte _0807B400 @ case 64
	.4byte _0807B400 @ case 65
	.4byte _0807B400 @ case 66
	.4byte _0807B400 @ case 67
	.4byte _0807B400 @ case 68
	.4byte _0807B400 @ case 69
	.4byte _0807B400 @ case 70
	.4byte _0807B3F0 @ case 71
	.4byte _0807B400 @ case 72
	.4byte _0807B3B8 @ case 73
	.4byte _0807B3B8 @ case 74
	.4byte _0807B3C0 @ case 75
	.4byte _0807B3C0 @ case 76
	.4byte _0807B3C0 @ case 77
	.4byte _0807B3C0 @ case 78
	.4byte _0807B3C8 @ case 79
	.4byte _0807B3C8 @ case 80
	.4byte _0807B3E8 @ case 81
	.4byte _0807B3D0 @ case 82
	.4byte _0807B3D0 @ case 83
	.4byte _0807B3D8 @ case 84
	.4byte _0807B3D8 @ case 85
	.4byte _0807B1C4 @ case 86
	.4byte _0807B1C4 @ case 87
	.4byte _0807B3E0 @ case 88
	.4byte _0807B400 @ case 89
	.4byte _0807B1B0 @ case 90
	.4byte _0807B1B0 @ case 91
	.4byte _0807B3E8 @ case 92
	.4byte _0807B3E8 @ case 93
	.4byte _0807B3E8 @ case 94
	.4byte _0807B3E8 @ case 95
	.4byte _0807B3E8 @ case 96
	.4byte _0807B400 @ case 97
	.4byte _0807B400 @ case 98
	.4byte _0807B400 @ case 99
	.4byte _0807B400 @ case 100
	.4byte _0807B400 @ case 101
	.4byte _0807B400 @ case 102
	.4byte _0807B400 @ case 103
	.4byte _0807B400 @ case 104
	.4byte _0807B400 @ case 105
	.4byte _0807B400 @ case 106
	.4byte _0807B400 @ case 107
	.4byte _0807B400 @ case 108
	.4byte _0807B400 @ case 109
	.4byte _0807B400 @ case 110
	.4byte _0807B436 @ case 111
	.4byte _0807B400 @ case 112
	.4byte _0807B400 @ case 113
	.4byte _0807B436 @ case 114
_0807B3B8:
	ldr r5, _0807B3BC @ =0x08A1313A
	b _0807B402
	.align 2, 0
_0807B3BC: .4byte 0x08A1313A
_0807B3C0:
	ldr r5, _0807B3C4 @ =0x08A1315C
	b _0807B402
	.align 2, 0
_0807B3C4: .4byte 0x08A1315C
_0807B3C8:
	ldr r5, _0807B3CC @ =0x08A131AA
	b _0807B402
	.align 2, 0
_0807B3CC: .4byte 0x08A131AA
_0807B3D0:
	ldr r5, _0807B3D4 @ =0x08A131C2
	b _0807B402
	.align 2, 0
_0807B3D4: .4byte 0x08A131C2
_0807B3D8:
	ldr r5, _0807B3DC @ =0x08A13088
	b _0807B402
	.align 2, 0
_0807B3DC: .4byte 0x08A13088
_0807B3E0:
	ldr r5, _0807B3E4 @ =0x08A131F0
	b _0807B402
	.align 2, 0
_0807B3E4: .4byte 0x08A131F0
_0807B3E8:
	ldr r5, _0807B3EC @ =0x08A13044
	b _0807B402
	.align 2, 0
_0807B3EC: .4byte 0x08A13044
_0807B3F0:
	ldr r5, _0807B3F4 @ =0x08A13256
	b _0807B402
	.align 2, 0
_0807B3F4: .4byte 0x08A13256
_0807B3F8:
	ldr r5, _0807B3FC @ =0x08A1328A
	b _0807B402
	.align 2, 0
_0807B3FC: .4byte 0x08A1328A
_0807B400:
	ldr r5, _0807B440 @ =0x08A13020
_0807B402:
	adds r2, r6, #0
	adds r2, #0x43
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5]
	bl sub_80D637C
	adds r4, r0, #0
	adds r0, r6, #0
	mov r1, sp
	bl sub_807B660
	lsls r4, r4, #1
	adds r4, r4, r5
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _0807B436
	ldrh r1, [r5, #2]
	mov r2, sp
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_807AC60
_0807B436:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B440: .4byte 0x08A13020

