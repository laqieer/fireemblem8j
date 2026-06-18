	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateHidden, 0x0805B0FC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_807004C, "ax", %progbits
@ NewEfxMantBatabata @ JP 0x0807004C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxMantBatabata
	.thumb_func
NewEfxMantBatabata:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetAnimPosition
	ldr r1, _08070078 @ =0x0203E17E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x6a
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x51
	bls _0807006E
	b _08070228
_0807006E:
	lsls r0, r0, #2
	ldr r1, _0807007C @ =_08070080
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08070078: .4byte 0x0203E17E
_0807007C: .4byte _08070080
_08070080: @ jump table
	.4byte _08070228 @ case 0
	.4byte _08070228 @ case 1
	.4byte _080701C8 @ case 2
	.4byte _08070228 @ case 3
	.4byte _080701C8 @ case 4
	.4byte _08070228 @ case 5
	.4byte _08070228 @ case 6
	.4byte _08070228 @ case 7
	.4byte _08070228 @ case 8
	.4byte _08070228 @ case 9
	.4byte _080701D8 @ case 10
	.4byte _080701D8 @ case 11
	.4byte _08070228 @ case 12
	.4byte _08070228 @ case 13
	.4byte _08070228 @ case 14
	.4byte _08070228 @ case 15
	.4byte _08070228 @ case 16
	.4byte _08070228 @ case 17
	.4byte _08070228 @ case 18
	.4byte _08070228 @ case 19
	.4byte _08070228 @ case 20
	.4byte _08070228 @ case 21
	.4byte _08070228 @ case 22
	.4byte _08070228 @ case 23
	.4byte _08070228 @ case 24
	.4byte _08070228 @ case 25
	.4byte _08070228 @ case 26
	.4byte _08070228 @ case 27
	.4byte _08070228 @ case 28
	.4byte _08070228 @ case 29
	.4byte _08070228 @ case 30
	.4byte _08070228 @ case 31
	.4byte _08070228 @ case 32
	.4byte _08070228 @ case 33
	.4byte _08070228 @ case 34
	.4byte _08070228 @ case 35
	.4byte _08070228 @ case 36
	.4byte _08070228 @ case 37
	.4byte _08070228 @ case 38
	.4byte _08070228 @ case 39
	.4byte _08070228 @ case 40
	.4byte _08070228 @ case 41
	.4byte _080701E8 @ case 42
	.4byte _08070228 @ case 43
	.4byte _08070228 @ case 44
	.4byte _08070228 @ case 45
	.4byte _08070228 @ case 46
	.4byte _08070228 @ case 47
	.4byte _08070228 @ case 48
	.4byte _08070228 @ case 49
	.4byte _080701F8 @ case 50
	.4byte _080701F8 @ case 51
	.4byte _08070228 @ case 52
	.4byte _08070228 @ case 53
	.4byte _08070228 @ case 54
	.4byte _08070228 @ case 55
	.4byte _08070228 @ case 56
	.4byte _08070228 @ case 57
	.4byte _08070228 @ case 58
	.4byte _08070228 @ case 59
	.4byte _08070228 @ case 60
	.4byte _08070228 @ case 61
	.4byte _08070228 @ case 62
	.4byte _08070228 @ case 63
	.4byte _08070228 @ case 64
	.4byte _08070228 @ case 65
	.4byte _08070228 @ case 66
	.4byte _08070228 @ case 67
	.4byte _08070228 @ case 68
	.4byte _08070228 @ case 69
	.4byte _08070228 @ case 70
	.4byte _08070228 @ case 71
	.4byte _08070228 @ case 72
	.4byte _08070228 @ case 73
	.4byte _08070228 @ case 74
	.4byte _08070228 @ case 75
	.4byte _08070228 @ case 76
	.4byte _08070228 @ case 77
	.4byte _08070228 @ case 78
	.4byte _08070208 @ case 79
	.4byte _08070208 @ case 80
	.4byte _08070218 @ case 81
_080701C8:
	ldr r5, _080701D0 @ =0x0861EAF0
	ldr r4, _080701D4 @ =0x0861EC9C
	b _0807022C
	.align 2, 0
_080701D0: .4byte 0x0861EAF0
_080701D4: .4byte 0x0861EC9C
_080701D8:
	ldr r5, _080701E0 @ =0x0861EE48
	ldr r4, _080701E4 @ =0x0861EFF0
	b _0807022C
	.align 2, 0
_080701E0: .4byte 0x0861EE48
_080701E4: .4byte 0x0861EFF0
_080701E8:
	ldr r5, _080701F0 @ =0x0861F0CC
	ldr r4, _080701F4 @ =0x0861F1B0
	b _0807022C
	.align 2, 0
_080701F0: .4byte 0x0861F0CC
_080701F4: .4byte 0x0861F1B0
_080701F8:
	ldr r5, _08070200 @ =0x0861F2B8
	ldr r4, _08070204 @ =0x0861F3BC
	b _0807022C
	.align 2, 0
_08070200: .4byte 0x0861F2B8
_08070204: .4byte 0x0861F3BC
_08070208:
	ldr r5, _08070210 @ =0x0861F598
	ldr r4, _08070214 @ =0x0861F814
	b _0807022C
	.align 2, 0
_08070210: .4byte 0x0861F598
_08070214: .4byte 0x0861F814
_08070218:
	ldr r5, _08070220 @ =0x0861F91C
	ldr r4, _08070224 @ =0x0861F984
	b _0807022C
	.align 2, 0
_08070220: .4byte 0x0861F91C
_08070224: .4byte 0x0861F984
_08070228:
	ldr r5, _08070288 @ =0x0861E7B0
	ldr r4, _0807028C @ =0x0861E944
_0807022C:
	ldr r0, _08070290 @ =0x086038D4
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r7, [r6, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r6, #0x2c]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08070294 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r6, #0x60]
	str r1, [r0]
	ldrh r1, [r4, #8]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08070298
	ldrh r0, [r4, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0807029E
	.align 2, 0
_08070288: .4byte 0x0861E7B0
_0807028C: .4byte 0x0861E944
_08070290: .4byte 0x086038D4
_08070294: .4byte 0x02000010
_08070298:
	ldrh r0, [r4, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0807029E:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

