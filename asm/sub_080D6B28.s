	.syntax unified
	.set __eqdf2, 0x080DB3F0 + 1
	.set __ltdf2, 0x080DB520 + 1
	.set __nedf2, 0x080DB43C + 1
	.set __sinit, 0x080D8C7C + 1
	.set __swsetup, 0x080D7BEC + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set _mbtowc_r, 0x080D982C + 1
	.set isinf, 0x080DA238 + 1
	.set isnan, 0x080DA25C + 1
	.set localeconv, 0x080D9224 + 1
	.set memchr, 0x080D9858 + 1
	.set strlen, 0x080D6A08 + 1
	.set sub_80D6A80, 0x080D6A80 + 1
	.set sub_80D6AA0, 0x080D6AA0 + 1
	.set sub_80D7A78, 0x080D7A78 + 1
	.set sub_80D7A88, 0x080D7A88 + 1
	.set sub_80D7B7C, 0x080D7B7C + 1
	.section .text.sub_080D6B28, "ax", %progbits
@ _vfprintf_r @ JP 0x080D6B28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _vfprintf_r
	.thumb_func
_vfprintf_r:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _080D6B90 @ =0xFFFFFDE0
	add sp, r4
	str r0, [sp, #0x1dc]
	str r1, [sp, #0x1e0]
	adds r4, r2, #0
	mov sl, r3
	bl localeconv
	ldr r0, [r0]
	str r0, [sp, #0x1f8]
	movs r1, #0
	add r0, sp, #0x1d0
	str r1, [r0]
	ldr r1, [sp, #0x1e0]
	ldr r0, [r1, #0x54]
	cmp r0, #0
	bne _080D6B5A
	ldr r0, _080D6B94 @ =0x08BB8A74
	ldr r0, [r0]
	str r0, [r1, #0x54]
_080D6B5A:
	ldr r2, [sp, #0x1e0]
	ldr r1, [r2, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080D6B6A
	adds r0, r1, #0
	bl __sinit
_080D6B6A:
	movs r0, #8
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D6B7E
	ldr r2, [sp, #0x1e0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _080D6B98
_080D6B7E:
	ldr r0, [sp, #0x1e0]
	bl __swsetup
	cmp r0, #0
	beq _080D6B98
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80D7A78
	.align 2, 0
_080D6B90: .4byte 0xFFFFFDE0
_080D6B94: .4byte 0x08BB8A74
_080D6B98:
	movs r0, #0x1a
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0xa
	bne _080D6BBC
	ldr r2, [sp, #0x1e0]
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _080D6BBC
	adds r0, r2, #0
	adds r1, r4, #0
	mov r2, sl
	bl sub_80D6AA0
	bl sub_80D7A78
_080D6BBC:
	str r4, [sp, #0x1e4]
	add r1, sp, #0x1c
	add r5, sp, #0x28
	str r5, [sp, #0x1c]
	movs r0, #0
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r2, #0
	str r2, [sp, #0x1f0]
	mov sb, r1
	movs r4, #0xe6
	lsls r4, r4, #1
	add r4, sp
	str r4, [sp, #0x214]
	movs r0, #0xe8
	lsls r0, r0, #1
	add r0, sp
	str r0, [sp, #0x218]
_080D6BE0:
	ldr r1, [sp, #0x1e4]
	mov r8, r1
_080D6BE4:
	ldr r0, _080D6C90 @ =0x08BB8A74
	ldr r0, [r0]
	ldr r1, _080D6C94 @ =0x08BB8A78
	ldr r3, [r1]
	ldr r2, [sp, #0x218]
	str r2, [sp]
	ldr r1, [sp, #0x214]
	ldr r2, [sp, #0x1e4]
	bl _mbtowc_r
	adds r4, r0, #0
	cmp r4, #0
	ble _080D6C12
	ldr r0, [sp, #0x1e4]
	adds r0, r0, r4
	str r0, [sp, #0x1e4]
	add r0, sp, #0x1cc
	ldr r0, [r0]
	cmp r0, #0x25
	bne _080D6BE4
	ldr r1, [sp, #0x1e4]
	subs r1, #1
	str r1, [sp, #0x1e4]
_080D6C12:
	ldr r2, [sp, #0x1e4]
	mov r0, r8
	subs r6, r2, r0
	cmp r6, #0
	beq _080D6C4A
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D6C44
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	beq _080D6C42
	bl _080D7A64
_080D6C42:
	add r5, sp, #0x28
_080D6C44:
	ldr r2, [sp, #0x1f0]
	adds r2, r2, r6
	str r2, [sp, #0x1f0]
_080D6C4A:
	cmp r4, #0
	bgt _080D6C52
	bl _080D7A4C
_080D6C52:
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	movs r0, #0
	str r0, [sp, #0x1ec]
	movs r1, #0
	str r1, [sp, #0x208]
	movs r2, #0
	str r2, [sp, #0x1f4]
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _080D6C98 @ =0x000001C9
	add r0, sp
	strb r2, [r0]
_080D6C6E:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
_080D6C7A:
	ldr r0, [sp, #0x1e8]
	subs r0, #0x20
	cmp r0, #0x58
	bls _080D6C84
	b _080D7336
_080D6C84:
	lsls r0, r0, #2
	ldr r1, _080D6C9C @ =_080D6CA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D6C90: .4byte 0x08BB8A74
_080D6C94: .4byte 0x08BB8A78
_080D6C98: .4byte 0x000001C9
_080D6C9C: .4byte _080D6CA0
_080D6CA0: @ jump table
	.4byte _080D6E04 @ case 0
	.4byte _080D7336 @ case 1
	.4byte _080D7336 @ case 2
	.4byte _080D6E1C @ case 3
	.4byte _080D7336 @ case 4
	.4byte _080D7336 @ case 5
	.4byte _080D7336 @ case 6
	.4byte _080D7336 @ case 7
	.4byte _080D7336 @ case 8
	.4byte _080D7336 @ case 9
	.4byte _080D6E20 @ case 10
	.4byte _080D6E3A @ case 11
	.4byte _080D7336 @ case 12
	.4byte _080D6E36 @ case 13
	.4byte _080D6E48 @ case 14
	.4byte _080D7336 @ case 15
	.4byte _080D6EA8 @ case 16
	.4byte _080D6EAC @ case 17
	.4byte _080D6EAC @ case 18
	.4byte _080D6EAC @ case 19
	.4byte _080D6EAC @ case 20
	.4byte _080D6EAC @ case 21
	.4byte _080D6EAC @ case 22
	.4byte _080D6EAC @ case 23
	.4byte _080D6EAC @ case 24
	.4byte _080D6EAC @ case 25
	.4byte _080D7336 @ case 26
	.4byte _080D7336 @ case 27
	.4byte _080D7336 @ case 28
	.4byte _080D7336 @ case 29
	.4byte _080D7336 @ case 30
	.4byte _080D7336 @ case 31
	.4byte _080D7336 @ case 32
	.4byte _080D7336 @ case 33
	.4byte _080D7336 @ case 34
	.4byte _080D7336 @ case 35
	.4byte _080D6F16 @ case 36
	.4byte _080D6F68 @ case 37
	.4byte _080D7336 @ case 38
	.4byte _080D6F68 @ case 39
	.4byte _080D7336 @ case 40
	.4byte _080D7336 @ case 41
	.4byte _080D7336 @ case 42
	.4byte _080D7336 @ case 43
	.4byte _080D6ED0 @ case 44
	.4byte _080D7336 @ case 45
	.4byte _080D7336 @ case 46
	.4byte _080D711E @ case 47
	.4byte _080D7336 @ case 48
	.4byte _080D7336 @ case 49
	.4byte _080D7336 @ case 50
	.4byte _080D7336 @ case 51
	.4byte _080D7336 @ case 52
	.4byte _080D71B6 @ case 53
	.4byte _080D7336 @ case 54
	.4byte _080D7336 @ case 55
	.4byte _080D71F2 @ case 56
	.4byte _080D7336 @ case 57
	.4byte _080D7336 @ case 58
	.4byte _080D7336 @ case 59
	.4byte _080D7336 @ case 60
	.4byte _080D7336 @ case 61
	.4byte _080D7336 @ case 62
	.4byte _080D7336 @ case 63
	.4byte _080D7336 @ case 64
	.4byte _080D7336 @ case 65
	.4byte _080D7336 @ case 66
	.4byte _080D6F04 @ case 67
	.4byte _080D6F1E @ case 68
	.4byte _080D6F68 @ case 69
	.4byte _080D6F68 @ case 70
	.4byte _080D6F68 @ case 71
	.4byte _080D6ED4 @ case 72
	.4byte _080D6F1E @ case 73
	.4byte _080D7336 @ case 74
	.4byte _080D7336 @ case 75
	.4byte _080D6ED8 @ case 76
	.4byte _080D7336 @ case 77
	.4byte _080D70D8 @ case 78
	.4byte _080D7126 @ case 79
	.4byte _080D7154 @ case 80
	.4byte _080D6EFA @ case 81
	.4byte _080D7336 @ case 82
	.4byte _080D7174 @ case 83
	.4byte _080D7336 @ case 84
	.4byte _080D71BE @ case 85
	.4byte _080D7336 @ case 86
	.4byte _080D7336 @ case 87
	.4byte _080D71FC @ case 88
_080D6E04:
	ldr r1, _080D6E18 @ =0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D6E10
	b _080D6C6E
_080D6E10:
	movs r0, #0x20
	strb r0, [r1]
	b _080D6C6E
	.align 2, 0
_080D6E18: .4byte 0x000001C9
_080D6E1C:
	movs r0, #1
	b _080D6EE8
_080D6E20:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	str r0, [sp, #0x1f4]
	cmp r0, #0
	blt _080D6E32
	b _080D6C6E
_080D6E32:
	rsbs r0, r0, #0
	str r0, [sp, #0x1f4]
_080D6E36:
	movs r0, #4
	b _080D6EFC
_080D6E3A:
	ldr r1, _080D6E44 @ =0x000001C9
	add r1, sp
	movs r0, #0x2b
	strb r0, [r1]
	b _080D6C6E
	.align 2, 0
_080D6E44: .4byte 0x000001C9
_080D6E48:
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	cmp r2, #0x2a
	bne _080D6E72
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080D6E6E
	b _080D6C6E
_080D6E6E:
	adds r6, r0, #0
	b _080D6C6E
_080D6E72:
	movs r4, #0
	ldr r0, [sp, #0x1e8]
	b _080D6E92
_080D6E78:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r1, [sp, #0x1e8]
	adds r4, r0, r1
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r0, [sp, #0x1e4]
	adds r0, #1
	str r0, [sp, #0x1e4]
	adds r0, r2, #0
_080D6E92:
	subs r0, #0x30
	cmp r0, #9
	bls _080D6E78
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080D6EA4
	b _080D6C7A
_080D6EA4:
	adds r6, r0, #0
	b _080D6C7A
_080D6EA8:
	movs r0, #0x80
	b _080D6EFC
_080D6EAC:
	movs r4, #0
_080D6EAE:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r2, [sp, #0x1e8]
	adds r4, r0, r2
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	subs r0, #0x30
	cmp r0, #9
	bls _080D6EAE
	str r4, [sp, #0x1f4]
	b _080D6C7A
_080D6ED0:
	movs r0, #8
	b _080D6EE8
_080D6ED4:
	movs r0, #0x40
	b _080D6EF2
_080D6ED8:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	cmp r0, #0x6c
	bne _080D6EF0
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	movs r0, #0x20
_080D6EE8:
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
	b _080D6C6E
_080D6EF0:
	movs r0, #0x10
_080D6EF2:
	ldr r4, [sp, #0x1ec]
	orrs r4, r0
	str r4, [sp, #0x1ec]
	b _080D6C6E
_080D6EFA:
	movs r0, #0x20
_080D6EFC:
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	b _080D6C6E
_080D6F04:
	add r2, sp, #0x68
	mov r8, r2
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	strb r0, [r2]
	b _080D7344
_080D6F16:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080D6F1E:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D6F2E
	movs r4, #4
	add sl, r4
	b _080D6F4A
_080D6F2E:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D6F46
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _080D6F50
_080D6F46:
	movs r2, #4
	add sl, r2
_080D6F4A:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D6F50:
	cmp r4, #0
	bge _080D6F5E
	rsbs r4, r4, #0
	ldr r1, _080D6F64 @ =0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080D6F5E:
	movs r2, #1
	b _080D724A
	.align 2, 0
_080D6F64: .4byte 0x000001C9
_080D6F68:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080D6F74
	movs r6, #6
	b _080D6F84
_080D6F74:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080D6F7E
	cmp r4, #0x47
	bne _080D6F84
_080D6F7E:
	cmp r6, #0
	bne _080D6F84
	movs r6, #1
_080D6F84:
	movs r0, #8
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	movs r2, #8
	add sl, r2
	mov r0, sl
	subs r0, #8
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x1fc]
	str r2, [sp, #0x200]
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl isinf
	cmp r0, #0
	beq _080D6FD8
	ldr r3, _080D6FCC @ =0x00000000
	ldr r2, _080D6FC8 @ =0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __ltdf2
	cmp r0, #0
	bge _080D6FBE
	ldr r1, _080D6FD0 @ =0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080D6FBE:
	ldr r2, _080D6FD4 @ =0x085773D4
	mov r8, r2
	movs r3, #3
	b _080D734E
	.align 2, 0
_080D6FC8: .4byte 0x00000000
_080D6FCC: .4byte 0x00000000
_080D6FD0: .4byte 0x000001C9
_080D6FD4: .4byte 0x085773D4
_080D6FD8:
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl isnan
	cmp r0, #0
	beq _080D6FF0
	ldr r4, _080D6FEC @ =0x085773D8
	mov r8, r4
	movs r3, #3
	b _080D734E
	.align 2, 0
_080D6FEC: .4byte 0x085773D8
_080D6FF0:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	str r1, [sp]
	add r0, sp, #0x1c8
	str r0, [sp, #4]
	add r0, sp, #0x1d4
	str r0, [sp, #8]
	ldr r2, [sp, #0x1e8]
	str r2, [sp, #0xc]
	add r0, sp, #0x1d8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1dc]
	ldr r1, [sp, #0x1fc]
	ldr r2, [sp, #0x200]
	adds r3, r6, #0
	bl sub_80D7A88
	mov r8, r0
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080D7024
	cmp r4, #0x47
	bne _080D7046
_080D7024:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	ble _080D7034
	cmp r1, r6
	ble _080D7042
_080D7034:
	movs r0, #0x45
	ldr r1, [sp, #0x1e8]
	cmp r1, #0x67
	bne _080D703E
	movs r0, #0x65
_080D703E:
	str r0, [sp, #0x1e8]
	b _080D7046
_080D7042:
	movs r2, #0x67
	str r2, [sp, #0x1e8]
_080D7046:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x65
	bgt _080D706C
	add r0, sp, #0x1d4
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	add r0, sp, #0x14
	ldr r2, [sp, #0x1e8]
	bl sub_80D7B7C
	str r0, [sp, #0x204]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	ldr r1, [sp, #0x204]
	adds r3, r1, r0
	cmp r0, #1
	bgt _080D70AC
	b _080D70A2
_080D706C:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x66
	bne _080D7094
	add r0, sp, #0x1d4
	ldr r0, [r0]
	cmp r0, #0
	ble _080D7090
	adds r3, r0, #0
	cmp r6, #0
	bne _080D708A
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D70BC
_080D708A:
	adds r0, r3, #1
	adds r3, r0, r6
	b _080D70BC
_080D7090:
	adds r3, r6, #2
	b _080D70BC
_080D7094:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	cmp r1, r0
	blt _080D70B0
	adds r3, r1, #0
_080D70A2:
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D70BC
_080D70AC:
	adds r3, #1
	b _080D70BC
_080D70B0:
	cmp r1, #0
	bgt _080D70BA
	adds r0, #2
	subs r3, r0, r1
	b _080D70BC
_080D70BA:
	adds r3, r0, #1
_080D70BC:
	add r0, sp, #0x1c8
	ldrb r0, [r0]
	adds r7, r5, #0
	adds r7, #8
	cmp r0, #0
	bne _080D70CA
	b _080D7352
_080D70CA:
	ldr r1, _080D70D4 @ =0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
	b _080D7352
	.align 2, 0
_080D70D4: .4byte 0x000001C9
_080D70D8:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080D70F2
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r1, [sp, #0x1f0]
	str r1, [r0]
	b _080D6BE0
_080D70F2:
	movs r0, #0x40
	ldr r2, [sp, #0x1ec]
	ands r2, r0
	cmp r2, #0
	beq _080D710E
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	add r1, sp, #0x1f0
	ldrh r1, [r1]
	strh r1, [r0]
	b _080D6BE0
_080D710E:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r4, [sp, #0x1f0]
	str r4, [r0]
	b _080D6BE0
_080D711E:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080D7126:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D7146
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D7146
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D7150
_080D7146:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D7150:
	movs r2, #0
	b _080D7242
_080D7154:
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	movs r2, #2
	ldr r1, _080D7170 @ =0x085773DC
	str r1, [sp, #0x210]
	ldr r0, [sp, #0x1ec]
	orrs r0, r2
	str r0, [sp, #0x1ec]
	movs r1, #0x78
	str r1, [sp, #0x1e8]
	b _080D7242
	.align 2, 0
_080D7170: .4byte 0x085773DC
_080D7174:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _080D7188
	ldr r4, _080D71A8 @ =0x085773F0
	mov r8, r4
_080D7188:
	cmp r6, #0
	blt _080D71AC
	mov r0, r8
	movs r1, #0
	adds r2, r6, #0
	bl memchr
	cmp r0, #0
	beq _080D71A4
	mov r1, r8
	subs r3, r0, r1
	cmp r3, r6
	bgt _080D71A4
	b _080D7346
_080D71A4:
	adds r3, r6, #0
	b _080D7346
	.align 2, 0
_080D71A8: .4byte 0x085773F0
_080D71AC:
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _080D7346
_080D71B6:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
_080D71BE:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080D71CE
	movs r0, #4
	add sl, r0
	b _080D71E8
_080D71CE:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D71E4
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D71EE
_080D71E4:
	movs r4, #4
	add sl, r4
_080D71E8:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D71EE:
	movs r2, #1
	b _080D7242
_080D71F2:
	ldr r0, _080D71F8 @ =0x085773F8
	str r0, [sp, #0x210]
	b _080D7200
	.align 2, 0
_080D71F8: .4byte 0x085773F8
_080D71FC:
	ldr r1, _080D7220 @ =0x085773DC
	str r1, [sp, #0x210]
_080D7200:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D7224
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D7224
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D722E
	.align 2, 0
_080D7220: .4byte 0x085773DC
_080D7224:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D722E:
	movs r2, #2
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D7242
	cmp r4, #0
	beq _080D7242
	orrs r1, r2
	str r1, [sp, #0x1ec]
_080D7242:
	ldr r1, _080D728C @ =0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080D724A:
	str r6, [sp, #0x208]
	cmp r6, #0
	blt _080D725A
	movs r0, #0x81
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1ec]
	ands r1, r0
	str r1, [sp, #0x1ec]
_080D725A:
	movs r0, #0xe2
	lsls r0, r0, #1
	add r0, sp
	mov r8, r0
	cmp r4, #0
	bne _080D7270
	adds r7, r5, #0
	adds r7, #8
	ldr r1, [sp, #0x208]
	cmp r1, #0
	beq _080D7328
_080D7270:
	cmp r2, #1
	beq _080D72CE
	cmp r2, #1
	blo _080D7294
	cmp r2, #2
	beq _080D7308
	ldr r2, _080D7290 @ =0x0857740C
	mov r8, r2
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _080D734E
	.align 2, 0
_080D728C: .4byte 0x000001C9
_080D7290: .4byte 0x0857740C
_080D7294:
	adds r7, r5, #0
	adds r7, #8
	movs r2, #7
_080D729A:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r2
	adds r1, r0, #0
	adds r1, #0x30
	mov r0, r8
	strb r1, [r0]
	lsrs r4, r4, #3
	cmp r4, #0
	bne _080D729A
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D7328
	cmp r1, #0x30
	beq _080D7328
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	movs r0, #0x30
	mov r1, r8
	strb r0, [r1]
	b _080D7328
_080D72CE:
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #9
	bls _080D72F8
_080D72D6:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x30
	mov r1, r8
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r4, r0, #0
	cmp r4, #9
	bhi _080D72D6
_080D72F8:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	adds r0, #0x30
	mov r4, r8
	strb r0, [r4]
	b _080D7328
_080D7308:
	adds r7, r5, #0
	adds r7, #8
	movs r1, #0xf
_080D730E:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r1
	ldr r2, [sp, #0x210]
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r2, r8
	strb r0, [r2]
	lsrs r4, r4, #4
	cmp r4, #0
	bne _080D730E
_080D7328:
	add r4, sp, #0x14
	mov r1, r8
	subs r0, r4, r1
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r3, r0, r2
	b _080D7352
_080D7336:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0
	bne _080D733E
	b _080D7A4C
_080D733E:
	add r0, sp, #0x68
	mov r8, r0
	strb r4, [r0]
_080D7344:
	movs r3, #1
_080D7346:
	ldr r1, _080D7370 @ =0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080D734E:
	adds r7, r5, #0
	adds r7, #8
_080D7352:
	str r3, [sp, #0x20c]
	ldr r2, [sp, #0x208]
	cmp r3, r2
	bge _080D735C
	str r2, [sp, #0x20c]
_080D735C:
	ldr r0, _080D7370 @ =0x000001C9
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D7374
	ldr r4, [sp, #0x20c]
	adds r4, #1
	str r4, [sp, #0x20c]
	b _080D7384
	.align 2, 0
_080D7370: .4byte 0x000001C9
_080D7374:
	movs r0, #2
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D7384
	ldr r2, [sp, #0x20c]
	adds r2, #2
	str r2, [sp, #0x20c]
_080D7384:
	movs r0, #0x84
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	bne _080D7404
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D7404
	ldr r1, _080D7430 @ =0x085773B4
	cmp r4, #0x10
	ble _080D73D8
	mov r6, sb
_080D73A0:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, r7, #0
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D73CE
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_80D6A80
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D73CA
	b _080D7A64
_080D73CA:
	add r5, sp, #0x28
	ldr r1, _080D7430 @ =0x085773B4
_080D73CE:
	subs r4, #0x10
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #0x10
	bgt _080D73A0
_080D73D8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, r7, #0
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D7404
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_80D6A80
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D7402
	b _080D7A64
_080D7402:
	add r5, sp, #0x28
_080D7404:
	ldr r1, _080D7434 @ =0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D7438
	str r1, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D7478
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	b _080D7468
	.align 2, 0
_080D7430: .4byte 0x085773B4
_080D7434: .4byte 0x000001C9
_080D7438:
	movs r2, #2
	ldr r0, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D7478
	add r1, sp, #0x1c4
	movs r0, #0x30
	strb r0, [r1]
	add r0, sp, #0x1e8
	ldrb r0, [r0]
	strb r0, [r1, #1]
	str r1, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D7478
	ldr r0, [sp, #0x1e0]
_080D7468:
	str r3, [sp, #0x21c]
	bl sub_80D6A80
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D7476
	b _080D7A64
_080D7476:
	add r5, sp, #0x28
_080D7478:
	movs r0, #0x84
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0x80
	bne _080D74F4
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D74F4
	ldr r1, _080D7590 @ =0x085773C4
	cmp r4, #0x10
	ble _080D74C8
	mov r6, sb
_080D7494:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D74C2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_80D6A80
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D74BE
	b _080D7A64
_080D74BE:
	add r5, sp, #0x28
	ldr r1, _080D7590 @ =0x085773C4
_080D74C2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D7494
_080D74C8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D74F4
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_80D6A80
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D74F2
	b _080D7A64
_080D74F2:
	add r5, sp, #0x28
_080D74F4:
	ldr r0, [sp, #0x208]
	subs r4, r0, r3
	cmp r4, #0
	ble _080D7562
	ldr r1, _080D7590 @ =0x085773C4
	cmp r4, #0x10
	ble _080D7538
	mov r6, sb
_080D7504:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D7532
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_80D6A80
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D752E
	b _080D7A64
_080D752E:
	add r5, sp, #0x28
	ldr r1, _080D7590 @ =0x085773C4
_080D7532:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D7504
_080D7538:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D7562
	ldr r0, [sp, #0x1e0]
	str r3, [sp, #0x21c]
	bl sub_80D6A80
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D7560
	b _080D7A64
_080D7560:
	add r5, sp, #0x28
_080D7562:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D7594
	mov r4, r8
	str r4, [r5]
	str r3, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r3
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	bgt _080D758A
	b _080D79AA
_080D758A:
	ldr r0, [sp, #0x1e0]
	b _080D79A0
	.align 2, 0
_080D7590: .4byte 0x085773C4
_080D7594:
	ldr r2, [sp, #0x1e8]
	cmp r2, #0x65
	bgt _080D759C
	b _080D7880
_080D759C:
	ldr r3, _080D7668 @ =0x00000000
	ldr r2, _080D7664 @ =0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __eqdf2
	cmp r0, #0
	bne _080D7674
	ldr r0, _080D766C @ =0x08577428
	str r0, [r5]
	movs r6, #1
	str r6, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D75D8
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D75D6
	b _080D7A64
_080D75D6:
	add r5, sp, #0x28
_080D75D8:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r1, r0
	blt _080D75EE
	ldr r0, [sp, #0x1ec]
	ands r0, r6
	cmp r0, #0
	bne _080D75EE
	b _080D79AA
_080D75EE:
	ldr r0, [sp, #0x1f8]
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D7616
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	beq _080D7614
	b _080D7A64
_080D7614:
	add r5, sp, #0x28
_080D7616:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	bgt _080D7620
	b _080D79AA
_080D7620:
	ldr r1, _080D7670 @ =0x085773C4
	cmp r4, #0x10
	ble _080D7658
	mov r6, sb
_080D7628:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D7652
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D764E
	b _080D7A64
_080D764E:
	add r5, sp, #0x28
	ldr r1, _080D7670 @ =0x085773C4
_080D7652:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D7628
_080D7658:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	b _080D798E
	.align 2, 0
_080D7664: .4byte 0x00000000
_080D7668: .4byte 0x00000000
_080D766C: .4byte 0x08577428
_080D7670: .4byte 0x085773C4
_080D7674:
	add r6, sp, #0x1d4
	ldr r2, [r6]
	cmp r2, #0
	bgt _080D775C
	ldr r0, _080D7754 @ =0x08577428
	str r0, [r5]
	movs r4, #1
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D76A6
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	beq _080D76A4
	b _080D7A64
_080D76A4:
	add r5, sp, #0x28
_080D76A6:
	ldr r2, [sp, #0x1f8]
	str r2, [r5]
	str r4, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D76D0
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D76CE
	b _080D7A64
_080D76CE:
	add r5, sp, #0x28
_080D76D0:
	ldr r0, [r6]
	rsbs r4, r0, #0
	cmp r4, #0
	ble _080D7736
	ldr r1, _080D7758 @ =0x085773C4
	cmp r4, #0x10
	ble _080D7710
	mov r6, sb
_080D76E0:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D770A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D7706
	b _080D7A64
_080D7706:
	add r5, sp, #0x28
	ldr r1, _080D7758 @ =0x085773C4
_080D770A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D76E0
_080D7710:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D7736
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	beq _080D7734
	b _080D7A64
_080D7734:
	add r5, sp, #0x28
_080D7736:
	mov r2, r8
	str r2, [r5]
	add r0, sp, #0x1d8
	ldr r1, [r0]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	b _080D7998
	.align 2, 0
_080D7754: .4byte 0x08577428
_080D7758: .4byte 0x085773C4
_080D775C:
	add r4, sp, #0x1d8
	ldr r1, [r4]
	cmp r2, r1
	blt _080D7818
	mov r0, r8
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D778E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D778C
	b _080D7A64
_080D778C:
	add r5, sp, #0x28
_080D778E:
	ldr r1, [r6]
	ldr r0, [r4]
	subs r4, r1, r0
	cmp r4, #0
	ble _080D77F6
	ldr r1, _080D7810 @ =0x085773C4
	cmp r4, #0x10
	ble _080D77D0
	mov r6, sb
_080D77A0:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D77CA
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D77C6
	b _080D7A64
_080D77C6:
	add r5, sp, #0x28
	ldr r1, _080D7810 @ =0x085773C4
_080D77CA:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D77A0
_080D77D0:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D77F6
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	beq _080D77F4
	b _080D7A64
_080D77F4:
	add r5, sp, #0x28
_080D77F6:
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	bne _080D7802
	b _080D79AA
_080D7802:
	ldr r0, _080D7814 @ =0x0857742C
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	b _080D798E
	.align 2, 0
_080D7810: .4byte 0x085773C4
_080D7814: .4byte 0x0857742C
_080D7818:
	mov r0, r8
	str r0, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D7840
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	beq _080D783E
	b _080D7A64
_080D783E:
	add r5, sp, #0x28
_080D7840:
	ldr r0, [r6]
	add r8, r0
	ldr r0, _080D787C @ =0x0857742C
	str r0, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D7870
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D786E
	b _080D7A64
_080D786E:
	add r5, sp, #0x28
_080D7870:
	mov r0, r8
	str r0, [r5]
	ldr r1, [r4]
	ldr r0, [r6]
	subs r1, r1, r0
	b _080D7986
	.align 2, 0
_080D787C: .4byte 0x0857742C
_080D7880:
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r0, #1
	bgt _080D7892
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D7958
_080D7892:
	add r1, sp, #0x1c4
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r1]
	movs r0, #1
	add r8, r0
	movs r0, #0x2e
	strb r0, [r1, #1]
	str r1, [r5]
	movs r0, #2
	str r0, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D78CA
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	beq _080D78C8
	b _080D7A64
_080D78C8:
	add r5, sp, #0x28
_080D78CA:
	ldr r3, _080D78F4 @ =0x00000000
	ldr r2, _080D78F0 @ =0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __nedf2
	cmp r0, #0
	beq _080D78F8
	mov r2, r8
	str r2, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	subs r0, #1
	adds r0, r0, r1
	b _080D7964
	.align 2, 0
_080D78F0: .4byte 0x00000000
_080D78F4: .4byte 0x00000000
_080D78F8:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	ble _080D7980
	ldr r1, _080D7954 @ =0x085773C4
	cmp r4, #0x10
	ble _080D7938
	mov r6, sb
_080D7908:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D7932
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	beq _080D792E
	b _080D7A64
_080D792E:
	add r5, sp, #0x28
	ldr r1, _080D7954 @ =0x085773C4
_080D7932:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D7908
_080D7938:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D7980
	ldr r0, [sp, #0x1e0]
	b _080D7976
	.align 2, 0
_080D7954: .4byte 0x085773C4
_080D7958:
	mov r2, r8
	str r2, [r5]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
_080D7964:
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D7980
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080D7976:
	bl sub_80D6A80
	cmp r0, #0
	bne _080D7A64
	add r5, sp, #0x28
_080D7980:
	add r0, sp, #0x14
	str r0, [r5]
	ldr r1, [sp, #0x204]
_080D7986:
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
_080D798E:
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
_080D7998:
	cmp r0, #7
	ble _080D79AA
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080D79A0:
	bl sub_80D6A80
	cmp r0, #0
	bne _080D7A64
	add r5, sp, #0x28
_080D79AA:
	movs r0, #4
	ldr r4, [sp, #0x1ec]
	ands r4, r0
	cmp r4, #0
	beq _080D7A16
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D7A16
	ldr r1, _080D7A48 @ =0x085773B4
	cmp r4, #0x10
	ble _080D79F4
	mov r6, sb
_080D79C6:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D79EE
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	bne _080D7A64
	add r5, sp, #0x28
	ldr r1, _080D7A48 @ =0x085773B4
_080D79EE:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D79C6
_080D79F4:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D7A16
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	bne _080D7A64
_080D7A16:
	ldr r0, [sp, #0x20c]
	ldr r4, [sp, #0x1f4]
	cmp r0, r4
	bge _080D7A20
	adds r0, r4, #0
_080D7A20:
	ldr r1, [sp, #0x1f0]
	adds r1, r1, r0
	str r1, [sp, #0x1f0]
	mov r2, sb
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _080D7A3A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_80D6A80
	cmp r0, #0
	bne _080D7A64
_080D7A3A:
	movs r0, #0
	mov r4, sb
	str r0, [r4, #4]
	add r5, sp, #0x28
	bl _080D6BE0
	.align 2, 0
_080D7A48: .4byte 0x085773B4
_080D7A4C:
	mov r1, sb
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _080D7A5E
	ldr r0, [sp, #0x1e0]
	bl sub_80D6A80
	cmp r0, #0
	bne _080D7A64
_080D7A5E:
	movs r0, #0
	mov r1, sb
	str r0, [r1, #4]
_080D7A64:
	movs r0, #0x40
	ldr r2, [sp, #0x1e0]
	ldrh r2, [r2, #0xc]
	ands r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080D7A76
	ldr r1, [sp, #0x1f0]
_080D7A76:
	adds r0, r1, #0
sub_80D7A78:
	movs r3, #0x88
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

