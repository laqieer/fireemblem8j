	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set sub_8029150, 0x08029150 + 1
	.section .text.sub_8028BB8, "ax", %progbits
@ sub_8028BB8 @ JP 0x08028BB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8028BB8
	.thumb_func
sub_8028BB8:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x56
	cmp r0, #0x6b
	bls _08028BCA
	b _08028E00
_08028BCA:
	lsls r0, r0, #2
	ldr r1, _08028BD4 @ =_08028BD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028BD4: .4byte _08028BD8
_08028BD8: @ jump table
	.4byte _08028D88 @ case 0
	.4byte _08028E00 @ case 1
	.4byte _08028E00 @ case 2
	.4byte _08028E00 @ case 3
	.4byte _08028E00 @ case 4
	.4byte _08028D88 @ case 5
	.4byte _08028D88 @ case 6
	.4byte _08028D88 @ case 7
	.4byte _08028D88 @ case 8
	.4byte _08028D88 @ case 9
	.4byte _08028D88 @ case 10
	.4byte _08028D88 @ case 11
	.4byte _08028D88 @ case 12
	.4byte _08028D88 @ case 13
	.4byte _08028DCC @ case 14
	.4byte _08028DCC @ case 15
	.4byte _08028DCC @ case 16
	.4byte _08028DCC @ case 17
	.4byte _08028DCC @ case 18
	.4byte _08028D90 @ case 19
	.4byte _08028D98 @ case 20
	.4byte _08028DA0 @ case 21
	.4byte _08028D88 @ case 22
	.4byte _08028D88 @ case 23
	.4byte _08028D88 @ case 24
	.4byte _08028D88 @ case 25
	.4byte _08028D88 @ case 26
	.4byte _08028E00 @ case 27
	.4byte _08028E00 @ case 28
	.4byte _08028E00 @ case 29
	.4byte _08028E00 @ case 30
	.4byte _08028E00 @ case 31
	.4byte _08028E00 @ case 32
	.4byte _08028E00 @ case 33
	.4byte _08028E00 @ case 34
	.4byte _08028D90 @ case 35
	.4byte _08028E00 @ case 36
	.4byte _08028E00 @ case 37
	.4byte _08028E00 @ case 38
	.4byte _08028E00 @ case 39
	.4byte _08028E00 @ case 40
	.4byte _08028E00 @ case 41
	.4byte _08028E00 @ case 42
	.4byte _08028E00 @ case 43
	.4byte _08028E00 @ case 44
	.4byte _08028E00 @ case 45
	.4byte _08028E00 @ case 46
	.4byte _08028E00 @ case 47
	.4byte _08028E00 @ case 48
	.4byte _08028E00 @ case 49
	.4byte _08028DCC @ case 50
	.4byte _08028E00 @ case 51
	.4byte _08028DCC @ case 52
	.4byte _08028E00 @ case 53
	.4byte _08028E00 @ case 54
	.4byte _08028E00 @ case 55
	.4byte _08028E00 @ case 56
	.4byte _08028E00 @ case 57
	.4byte _08028E00 @ case 58
	.4byte _08028E00 @ case 59
	.4byte _08028E00 @ case 60
	.4byte _08028E00 @ case 61
	.4byte _08028E00 @ case 62
	.4byte _08028E00 @ case 63
	.4byte _08028E00 @ case 64
	.4byte _08028DCC @ case 65
	.4byte _08028DCC @ case 66
	.4byte _08028DCC @ case 67
	.4byte _08028E00 @ case 68
	.4byte _08028E00 @ case 69
	.4byte _08028E00 @ case 70
	.4byte _08028E00 @ case 71
	.4byte _08028E00 @ case 72
	.4byte _08028E00 @ case 73
	.4byte _08028E00 @ case 74
	.4byte _08028E00 @ case 75
	.4byte _08028D88 @ case 76
	.4byte _08028E00 @ case 77
	.4byte _08028E00 @ case 78
	.4byte _08028E00 @ case 79
	.4byte _08028E00 @ case 80
	.4byte _08028E00 @ case 81
	.4byte _08028E00 @ case 82
	.4byte _08028E00 @ case 83
	.4byte _08028E00 @ case 84
	.4byte _08028E00 @ case 85
	.4byte _08028E00 @ case 86
	.4byte _08028E00 @ case 87
	.4byte _08028E00 @ case 88
	.4byte _08028E00 @ case 89
	.4byte _08028E00 @ case 90
	.4byte _08028E00 @ case 91
	.4byte _08028E00 @ case 92
	.4byte _08028E00 @ case 93
	.4byte _08028E00 @ case 94
	.4byte _08028E00 @ case 95
	.4byte _08028E00 @ case 96
	.4byte _08028DF8 @ case 97
	.4byte _08028E00 @ case 98
	.4byte _08028E00 @ case 99
	.4byte _08028E00 @ case 100
	.4byte _08028E00 @ case 101
	.4byte _08028E00 @ case 102
	.4byte _08028E00 @ case 103
	.4byte _08028E00 @ case 104
	.4byte _08028E00 @ case 105
	.4byte _08028E00 @ case 106
	.4byte _08028DCC @ case 107
_08028D88:
	ldr r0, _08028D8C @ =0x000007D7
	b _08028E04
	.align 2, 0
_08028D8C: .4byte 0x000007D7
_08028D90:
	ldr r0, _08028D94 @ =0x000007DC
	b _08028E04
	.align 2, 0
_08028D94: .4byte 0x000007DC
_08028D98:
	ldr r0, _08028D9C @ =0x000007DB
	b _08028E04
	.align 2, 0
_08028D9C: .4byte 0x000007DB
_08028DA0:
	ldr r0, _08028DBC @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08028DC4
	ldr r0, _08028DC0 @ =0x000007DF
	b _08028E04
	.align 2, 0
_08028DBC: .4byte 0x03004DF0
_08028DC0: .4byte 0x000007DF
_08028DC4:
	ldr r0, _08028DC8 @ =0x000007DD
	b _08028E04
	.align 2, 0
_08028DC8: .4byte 0x000007DD
_08028DCC:
	ldr r4, _08028DF0 @ =0x03004DF0
	ldr r1, [r4]
	movs r5, #8
	ldrsb r5, [r1, r5]
	movs r0, #0xa
	strb r0, [r1, #8]
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_8029150
	lsls r0, r0, #0x18
	ldr r1, [r4]
	strb r5, [r1, #8]
	cmp r0, #0
	beq _08028E00
	ldr r0, _08028DF4 @ =0x000007D9
	b _08028E04
	.align 2, 0
_08028DF0: .4byte 0x03004DF0
_08028DF4: .4byte 0x000007D9
_08028DF8:
	ldr r0, _08028DFC @ =0x000007DA
	b _08028E04
	.align 2, 0
_08028DFC: .4byte 0x000007DA
_08028E00:
	movs r0, #0xfb
	lsls r0, r0, #3
_08028E04:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

