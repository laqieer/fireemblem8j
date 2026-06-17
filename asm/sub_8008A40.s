	.syntax unified
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003E6C, 0x08003E6C + 1
	.set sub_8014328, 0x08014328 + 1
	.set sub_8031430, 0x08031430 + 1
	.section .text.sub_8008A40, "ax", %progbits
@ GetStrTalkLen @ JP 0x08008A40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetStrTalkLen
	.thumb_func
GetStrTalkLen:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	ldr r0, _08008A74 @ =0x085B90D4
	ldr r0, [r0]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	mov sb, r1
	ldrb r5, [r0, #0x11]
	movs r6, #0
	movs r7, #0x18
_08008A62:
	ldrb r0, [r4]
	cmp r0, #0x81
	bls _08008A6A
	b _08008DD0
_08008A6A:
	lsls r0, r0, #2
	ldr r1, _08008A78 @ =_08008A7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008A74: .4byte 0x085B90D4
_08008A78: .4byte _08008A7C
_08008A7C: @ jump table
	.4byte _08008C84 @ case 0
	.4byte _08008C8E @ case 1
	.4byte _08008C8E @ case 2
	.4byte _08008C9A @ case 3
	.4byte _08008C96 @ case 4
	.4byte _08008C96 @ case 5
	.4byte _08008C96 @ case 6
	.4byte _08008C96 @ case 7
	.4byte _08008C9E @ case 8
	.4byte _08008C9E @ case 9
	.4byte _08008C9E @ case 10
	.4byte _08008C9E @ case 11
	.4byte _08008C9E @ case 12
	.4byte _08008C9E @ case 13
	.4byte _08008C9E @ case 14
	.4byte _08008C9E @ case 15
	.4byte _08008CA6 @ case 16
	.4byte _08008CC4 @ case 17
	.4byte _08008CCA @ case 18
	.4byte _08008CCA @ case 19
	.4byte _08008CCA @ case 20
	.4byte _08008C84 @ case 21
	.4byte _08008C96 @ case 22
	.4byte _08008C96 @ case 23
	.4byte _08008CD2 @ case 24
	.4byte _08008CD2 @ case 25
	.4byte _08008CD2 @ case 26
	.4byte _08008CD2 @ case 27
	.4byte _08008C96 @ case 28
	.4byte _08008C96 @ case 29
	.4byte _08008DD0 @ case 30
	.4byte _08008DD0 @ case 31
	.4byte _08008DD0 @ case 32
	.4byte _08008DD0 @ case 33
	.4byte _08008DD0 @ case 34
	.4byte _08008DD0 @ case 35
	.4byte _08008DD0 @ case 36
	.4byte _08008DD0 @ case 37
	.4byte _08008DD0 @ case 38
	.4byte _08008DD0 @ case 39
	.4byte _08008DD0 @ case 40
	.4byte _08008DD0 @ case 41
	.4byte _08008DD0 @ case 42
	.4byte _08008DD0 @ case 43
	.4byte _08008DD0 @ case 44
	.4byte _08008DD0 @ case 45
	.4byte _08008DD0 @ case 46
	.4byte _08008DD0 @ case 47
	.4byte _08008DD0 @ case 48
	.4byte _08008DD0 @ case 49
	.4byte _08008DD0 @ case 50
	.4byte _08008DD0 @ case 51
	.4byte _08008DD0 @ case 52
	.4byte _08008DD0 @ case 53
	.4byte _08008DD0 @ case 54
	.4byte _08008DD0 @ case 55
	.4byte _08008DD0 @ case 56
	.4byte _08008DD0 @ case 57
	.4byte _08008DD0 @ case 58
	.4byte _08008DD0 @ case 59
	.4byte _08008DD0 @ case 60
	.4byte _08008DD0 @ case 61
	.4byte _08008DD0 @ case 62
	.4byte _08008DD0 @ case 63
	.4byte _08008DD0 @ case 64
	.4byte _08008DD0 @ case 65
	.4byte _08008DD0 @ case 66
	.4byte _08008DD0 @ case 67
	.4byte _08008DD0 @ case 68
	.4byte _08008DD0 @ case 69
	.4byte _08008DD0 @ case 70
	.4byte _08008DD0 @ case 71
	.4byte _08008DD0 @ case 72
	.4byte _08008DD0 @ case 73
	.4byte _08008DD0 @ case 74
	.4byte _08008DD0 @ case 75
	.4byte _08008DD0 @ case 76
	.4byte _08008DD0 @ case 77
	.4byte _08008DD0 @ case 78
	.4byte _08008DD0 @ case 79
	.4byte _08008DD0 @ case 80
	.4byte _08008DD0 @ case 81
	.4byte _08008DD0 @ case 82
	.4byte _08008DD0 @ case 83
	.4byte _08008DD0 @ case 84
	.4byte _08008DD0 @ case 85
	.4byte _08008DD0 @ case 86
	.4byte _08008DD0 @ case 87
	.4byte _08008DD0 @ case 88
	.4byte _08008DD0 @ case 89
	.4byte _08008DD0 @ case 90
	.4byte _08008DD0 @ case 91
	.4byte _08008DD0 @ case 92
	.4byte _08008DD0 @ case 93
	.4byte _08008DD0 @ case 94
	.4byte _08008DD0 @ case 95
	.4byte _08008DD0 @ case 96
	.4byte _08008DD0 @ case 97
	.4byte _08008DD0 @ case 98
	.4byte _08008DD0 @ case 99
	.4byte _08008DD0 @ case 100
	.4byte _08008DD0 @ case 101
	.4byte _08008DD0 @ case 102
	.4byte _08008DD0 @ case 103
	.4byte _08008DD0 @ case 104
	.4byte _08008DD0 @ case 105
	.4byte _08008DD0 @ case 106
	.4byte _08008DD0 @ case 107
	.4byte _08008DD0 @ case 108
	.4byte _08008DD0 @ case 109
	.4byte _08008DD0 @ case 110
	.4byte _08008DD0 @ case 111
	.4byte _08008DD0 @ case 112
	.4byte _08008DD0 @ case 113
	.4byte _08008DD0 @ case 114
	.4byte _08008DD0 @ case 115
	.4byte _08008DD0 @ case 116
	.4byte _08008DD0 @ case 117
	.4byte _08008DD0 @ case 118
	.4byte _08008DD0 @ case 119
	.4byte _08008DD0 @ case 120
	.4byte _08008DD0 @ case 121
	.4byte _08008DD0 @ case 122
	.4byte _08008DD0 @ case 123
	.4byte _08008DD0 @ case 124
	.4byte _08008DD0 @ case 125
	.4byte _08008DD0 @ case 126
	.4byte _08008DD0 @ case 127
	.4byte _08008CD6 @ case 128
	.4byte _08008DC4 @ case 129
_08008C84:
	cmp r6, r7
	bgt _08008C8A
	b _08008DF6
_08008C8A:
	adds r7, r6, #0
	b _08008DF6
_08008C8E:
	cmp r6, r7
	ble _08008C94
	adds r7, r6, #0
_08008C94:
	movs r6, #0
_08008C96:
	adds r4, #1
	b _08008A62
_08008C9A:
	adds r6, #0xc
	b _08008C96
_08008C9E:
	ldrb r0, [r4]
	adds r5, r0, #0
	subs r5, #8
	b _08008C96
_08008CA6:
	ldrb r0, [r4]
	cmp r0, #8
	bge _08008CAE
	b _08008A62
_08008CAE:
	cmp r0, #0xf
	ble _08008CB8
	cmp r0, #0x10
	beq _08008CC0
	b _08008A62
_08008CB8:
	adds r5, r0, #0
	subs r5, #8
	adds r4, #1
	b _08008CA6
_08008CC0:
	adds r4, #3
	b _08008CA6
_08008CC4:
	cmp r5, sb
	beq _08008C84
	b _08008C96
_08008CCA:
	mov r0, r8
	cmp r0, #0
	beq _08008C84
	b _08008C96
_08008CD2:
	adds r6, #0x80
	b _08008C96
_08008CD6:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0x25
	bls _08008CE0
	b _08008A62
_08008CE0:
	lsls r0, r0, #2
	ldr r1, _08008CEC @ =_08008CF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008CEC: .4byte _08008CF0
_08008CF0: @ jump table
	.4byte _08008C96 @ case 0
	.4byte _08008C96 @ case 1
	.4byte _08008C96 @ case 2
	.4byte _08008C96 @ case 3
	.4byte _08008C96 @ case 4
	.4byte _08008D88 @ case 5
	.4byte _08008DA6 @ case 6
	.4byte _08008C96 @ case 7
	.4byte _08008C96 @ case 8
	.4byte _08008C96 @ case 9
	.4byte _08008DBC @ case 10
	.4byte _08008DBC @ case 11
	.4byte _08008DBC @ case 12
	.4byte _08008DBC @ case 13
	.4byte _08008DBC @ case 14
	.4byte _08008DBC @ case 15
	.4byte _08008DBC @ case 16
	.4byte _08008DBC @ case 17
	.4byte _08008A62 @ case 18
	.4byte _08008A62 @ case 19
	.4byte _08008A62 @ case 20
	.4byte _08008A62 @ case 21
	.4byte _08008C96 @ case 22
	.4byte _08008C96 @ case 23
	.4byte _08008C96 @ case 24
	.4byte _08008C96 @ case 25
	.4byte _08008C96 @ case 26
	.4byte _08008C96 @ case 27
	.4byte _08008C96 @ case 28
	.4byte _08008C96 @ case 29
	.4byte _08008C96 @ case 30
	.4byte _08008C96 @ case 31
	.4byte _08008D9C @ case 32
	.4byte _08008C96 @ case 33
	.4byte _08008A62 @ case 34
	.4byte _08008A62 @ case 35
	.4byte _08008C96 @ case 36
	.4byte _08008C96 @ case 37
_08008D88:
	ldr r0, _08008D98 @ =0x085B90D4
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	mov r1, sp
	bl sub_8014328
	mov r0, sp
	b _08008DAC
	.align 2, 0
_08008D98: .4byte 0x085B90D4
_08008D9C:
	bl sub_8031430
	bl sub_8003E0C
	b _08008DB2
_08008DA6:
	ldr r0, _08008DB8 @ =0x085B90D4
	ldr r0, [r0]
	adds r0, #0x60
_08008DAC:
	mov r1, r8
	bl GetStrTalkLen
_08008DB2:
	adds r6, r6, r0
	b _08008C96
	.align 2, 0
_08008DB8: .4byte 0x085B90D4
_08008DBC:
	ldrb r0, [r4]
	adds r5, r0, #0
	subs r5, #0xa
	b _08008C96
_08008DC4:
	ldrb r0, [r4, #1]
	cmp r0, #0x40
	bne _08008DD0
	adds r4, #2
	adds r6, #6
	b _08008A62
_08008DD0:
	cmp r5, sb
	beq _08008DE6
	cmp r5, #0xff
	beq _08008DE6
	mov r1, r8
	cmp r1, #0
	beq _08008DE0
	b _08008C84
_08008DE0:
	movs r0, #1
	mov r8, r0
	mov sb, r5
_08008DE6:
	add r1, sp, #0x20
	adds r0, r4, #0
	bl sub_8003E6C
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	adds r6, r6, r0
	b _08008A62
_08008DF6:
	adds r0, r7, #0
	add sp, #0x24
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

