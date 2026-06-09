	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set SetItemUseAction, 0x080294EC + 1
	.set SetStaffUseAction, 0x080294C4 + 1
	.set sub_8029510, 0x08029510 + 1
	.set sub_8029550, 0x08029550 + 1
	.set sub_802981C, 0x0802981C + 1
	.set sub_8029890, 0x08029890 + 1
	.set sub_8029944, 0x08029944 + 1
	.set sub_8029B18, 0x08029B18 + 1
	.set sub_8029B54, 0x08029B54 + 1
	.set sub_8029BC0, 0x08029BC0 + 1
	.set sub_8029C2C, 0x08029C2C + 1
	.set sub_8029E64, 0x08029E64 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8028E0C, "ax", %progbits
@ sub_8028E0C @ JP 0x08028E0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8028E0C
	.thumb_func
sub_8028E0C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_804F610
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x4b
	cmp r0, #0x41
	bls _08028E2A
	b _08029004
_08028E2A:
	lsls r0, r0, #2
	ldr r1, _08028E34 @ =_08028E38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028E34: .4byte _08028E38
_08028E38: @ jump table
	.4byte _08028F40 @ case 0
	.4byte _08028F40 @ case 1
	.4byte _08028F40 @ case 2
	.4byte _08028F48 @ case 3
	.4byte _08028FBC @ case 4
	.4byte _08028F68 @ case 5
	.4byte _08028F78 @ case 6
	.4byte _08028F80 @ case 7
	.4byte _08028F88 @ case 8
	.4byte _08028FAC @ case 9
	.4byte _08028F58 @ case 10
	.4byte _08028FE8 @ case 11
	.4byte _08028FB4 @ case 12
	.4byte _08028FA0 @ case 13
	.4byte _08028F98 @ case 14
	.4byte _08029004 @ case 15
	.4byte _08029004 @ case 16
	.4byte _08029004 @ case 17
	.4byte _08029004 @ case 18
	.4byte _08029004 @ case 19
	.4byte _08029004 @ case 20
	.4byte _08029004 @ case 21
	.4byte _08029004 @ case 22
	.4byte _08029004 @ case 23
	.4byte _08029004 @ case 24
	.4byte _08029004 @ case 25
	.4byte _08029004 @ case 26
	.4byte _08029004 @ case 27
	.4byte _08029004 @ case 28
	.4byte _08029004 @ case 29
	.4byte _08029004 @ case 30
	.4byte _08029004 @ case 31
	.4byte _08029004 @ case 32
	.4byte _08029004 @ case 33
	.4byte _08029004 @ case 34
	.4byte _08029004 @ case 35
	.4byte _08029004 @ case 36
	.4byte _08029004 @ case 37
	.4byte _08029004 @ case 38
	.4byte _08029004 @ case 39
	.4byte _08029004 @ case 40
	.4byte _08029004 @ case 41
	.4byte _08029004 @ case 42
	.4byte _08029004 @ case 43
	.4byte _08029004 @ case 44
	.4byte _08029004 @ case 45
	.4byte _08029004 @ case 46
	.4byte _08028FC4 @ case 47
	.4byte _08028FD4 @ case 48
	.4byte _08029004 @ case 49
	.4byte _08028FF0 @ case 50
	.4byte _08028FF0 @ case 51
	.4byte _08028FF0 @ case 52
	.4byte _08028FF0 @ case 53
	.4byte _08029004 @ case 54
	.4byte _08029004 @ case 55
	.4byte _08029004 @ case 56
	.4byte _08029004 @ case 57
	.4byte _08029004 @ case 58
	.4byte _08029004 @ case 59
	.4byte _08029004 @ case 60
	.4byte _08029004 @ case 61
	.4byte _08029004 @ case 62
	.4byte _08029004 @ case 63
	.4byte _08029004 @ case 64
	.4byte _08028FBC @ case 65
_08028F40:
	ldr r1, _08028F44 @ =sub_8025E20
	b _08028F4A
	.align 2, 0
_08028F44: .4byte 0x08025E21  @ sub_8025E20
_08028F48:
	ldr r1, _08028F54 @ =sub_8025E54
_08028F4A:
	adds r0, r5, #0
	bl sub_8029B18
	b _0802900A
	.align 2, 0
_08028F54: .4byte 0x08025E55  @ sub_8025E54
_08028F58:
	ldr r1, _08028F64 @ =sub_802607C
	adds r0, r5, #0
	bl sub_8029510
	b _0802900A
	.align 2, 0
_08028F64: .4byte 0x0802607D  @ sub_802607C
_08028F68:
	ldr r1, _08028F74 @ =sub_8025F8C
	adds r0, r5, #0
	bl sub_8029B54
	b _0802900A
	.align 2, 0
_08028F74: .4byte 0x08025F8D  @ sub_8025F8C
_08028F78:
	ldr r1, _08028F7C @ =sub_8026188
	b _08028F8A
	.align 2, 0
_08028F7C: .4byte 0x08026189  @ sub_8026188
_08028F80:
	ldr r1, _08028F84 @ =sub_80261B0
	b _08028F8A
	.align 2, 0
_08028F84: .4byte 0x080261B1  @ sub_80261B0
_08028F88:
	ldr r1, _08028F94 @ =sub_80261D8
_08028F8A:
	adds r0, r5, #0
	bl sub_8029C2C
	b _0802900A
	.align 2, 0
_08028F94: .4byte 0x080261D9  @ sub_80261D8
_08028F98:
	adds r0, r5, #0
	bl sub_8029BC0
	b _0802900A
_08028FA0:
	ldr r1, _08028FA8 @ =sub_802626C
	movs r2, #0xff
	lsls r2, r2, #3
	b _08028FD8
	.align 2, 0
_08028FA8: .4byte 0x0802626D  @ sub_802626C
_08028FAC:
	adds r0, r5, #0
	bl sub_802981C
	b _0802900A
_08028FB4:
	adds r0, r5, #0
	bl sub_8029944
	b _0802900A
_08028FBC:
	adds r0, r5, #0
	bl SetStaffUseAction
	b _0802900A
_08028FC4:
	ldr r1, _08028FCC @ =sub_8026494
	ldr r2, _08028FD0 @ =0x000007FB
	b _08028FD8
	.align 2, 0
_08028FCC: .4byte 0x08026495  @ sub_8026494
_08028FD0: .4byte 0x000007FB
_08028FD4:
	ldr r1, _08028FE0 @ =sub_8026524
	ldr r2, _08028FE4 @ =0x000007FC
_08028FD8:
	adds r0, r5, #0
	bl sub_8029890
	b _0802900A
	.align 2, 0
_08028FE0: .4byte 0x08026525  @ sub_8026524
_08028FE4: .4byte 0x000007FC
_08028FE8:
	adds r0, r5, #0
	bl sub_8029E64
	b _0802900A
_08028FF0:
	ldr r1, _08028FFC @ =sub_8026588
	ldr r2, _08029000 @ =0x000007FD
	adds r0, r5, #0
	bl sub_8029550
	b _0802900A
	.align 2, 0
_08028FFC: .4byte 0x08026589  @ sub_8026588
_08029000: .4byte 0x000007FD
_08029004:
	adds r0, r5, #0
	bl SetItemUseAction
_0802900A:
	pop {r4, r5}
	pop {r0}
	bx r0

