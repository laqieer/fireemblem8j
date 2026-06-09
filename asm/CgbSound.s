	.syntax unified
	.set CgbModVol, 0x080D59C0 + 1
	.set CgbOscOff, 0x080D5970 + 1
	.section .text.CgbSound, "ax", %progbits
@ CgbSound @ JP 0x080D5A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CgbSound
	.thumb_func
CgbSound:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _080D5A48 @ =0x03007FF0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _080D5A4C
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _080D5A52
	.align 2, 0
_080D5A48: .4byte 0x03007FF0
_080D5A4C:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_080D5A52:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_080D5A58:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _080D5A6E
	b _080D5E58
_080D5A6E:
	cmp r6, #2
	beq _080D5AA0
	cmp r6, #2
	bgt _080D5A7C
	cmp r6, #1
	beq _080D5A82
	b _080D5AD8
_080D5A7C:
	cmp r6, #3
	beq _080D5AB8
	b _080D5AD8
_080D5A82:
	ldr r0, _080D5A94 @ =0x04000060
	str r0, [sp, #8]
	ldr r7, _080D5A98 @ =0x04000062
	ldr r2, _080D5A9C @ =0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080D5AE8
	.align 2, 0
_080D5A94: .4byte 0x04000060
_080D5A98: .4byte 0x04000062
_080D5A9C: .4byte 0x04000063
_080D5AA0:
	ldr r0, _080D5AAC @ =0x04000061
	str r0, [sp, #8]
	ldr r7, _080D5AB0 @ =0x04000068
	ldr r2, _080D5AB4 @ =0x04000069
	b _080D5AE0
	.align 2, 0
_080D5AAC: .4byte 0x04000061
_080D5AB0: .4byte 0x04000068
_080D5AB4: .4byte 0x04000069
_080D5AB8:
	ldr r0, _080D5ACC @ =0x04000070
	str r0, [sp, #8]
	ldr r7, _080D5AD0 @ =0x04000072
	ldr r2, _080D5AD4 @ =0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080D5AE8
	.align 2, 0
_080D5ACC: .4byte 0x04000070
_080D5AD0: .4byte 0x04000072
_080D5AD4: .4byte 0x04000073
_080D5AD8:
	ldr r0, _080D5B38 @ =0x04000071
	str r0, [sp, #8]
	ldr r7, _080D5B3C @ =0x04000078
	ldr r2, _080D5B40 @ =0x04000079
_080D5AE0:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_080D5AE8:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080D5BDE
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _080D5C02
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl CgbModVol
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _080D5B50
	cmp r6, #2
	bgt _080D5B44
	cmp r6, #1
	beq _080D5B4A
	b _080D5BA4
	.align 2, 0
_080D5B38: .4byte 0x04000071
_080D5B3C: .4byte 0x04000078
_080D5B40: .4byte 0x04000079
_080D5B44:
	cmp r6, #3
	beq _080D5B5C
	b _080D5BA4
_080D5B4A:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_080D5B50:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _080D5BB0
_080D5B5C:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _080D5B84
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _080D5B98 @ =0x04000090
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_080D5B84:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080D5B9C
	movs r0, #0xc0
	b _080D5BBE
	.align 2, 0
_080D5B98: .4byte 0x04000090
_080D5B9C:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _080D5BC0
_080D5BA4:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_080D5BB0:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080D5BBE
	movs r0, #0x40
_080D5BBE:
	strb r0, [r4, #0x1a]
_080D5BC0:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _080D5BDA
	b _080D5D16
_080D5BDA:
	strb r2, [r4, #9]
	b _080D5D44
_080D5BDE:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080D5C10
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _080D5C02
	b _080D5D56
_080D5C02:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _080D5E54
_080D5C10:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _080D5C50
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080D5C50
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080D5C82
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D5D44
	ldrb r2, [r4, #7]
	mov r8, r2
	b _080D5D44
_080D5C50:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _080D5D44
	cmp r6, #3
	bne _080D5C62
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_080D5C62:
	adds r0, r4, #0
	bl CgbModVol
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _080D5CB6
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080D5CB2
_080D5C82:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5C02
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D5D56
	movs r2, #8
	mov r8, r2
	b _080D5D56
_080D5CB2:
	ldrb r0, [r4, #7]
	b _080D5D42
_080D5CB6:
	cmp r0, #1
	bne _080D5CC2
_080D5CBA:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _080D5D42
_080D5CC2:
	cmp r0, #2
	bne _080D5D06
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _080D5D02
_080D5CDA:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _080D5CEA
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _080D5C82
_080D5CEA:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D5CBA
	movs r0, #8
	mov r8, r0
	b _080D5CBA
_080D5D02:
	ldrb r0, [r4, #5]
	b _080D5D42
_080D5D06:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _080D5D40
_080D5D16:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080D5CDA
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _080D5D44
	ldrb r2, [r4, #5]
	mov r8, r2
	b _080D5D44
_080D5D40:
	ldrb r0, [r4, #4]
_080D5D42:
	strb r0, [r4, #0xb]
_080D5D44:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _080D5D56
	subs r0, #1
	str r0, [sp]
	b _080D5C50
_080D5D56:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _080D5DCE
	cmp r6, #3
	bgt _080D5D96
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _080D5D96
	ldr r0, _080D5D80 @ =0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _080D5D88
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _080D5D84 @ =0x000007FC
	b _080D5D92
	.align 2, 0
_080D5D80: .4byte 0x04000089
_080D5D84: .4byte 0x000007FC
_080D5D88:
	cmp r0, #0x7f
	bgt _080D5D96
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _080D5DA4 @ =0x000007FE
_080D5D92:
	ands r0, r1
	str r0, [r4, #0x20]
_080D5D96:
	cmp r6, #4
	beq _080D5DA8
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _080D5DB6
	.align 2, 0
_080D5DA4: .4byte 0x000007FE
_080D5DA8:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_080D5DB6:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080D5DCE:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _080D5E54
	ldr r1, _080D5E18 @ =0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _080D5E20
	ldr r0, _080D5E1C @ =0x081F70A4
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _080D5E54
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _080D5E54
	.align 2, 0
_080D5E18: .4byte 0x04000081
_080D5E1C: .4byte 0x081F70A4
_080D5E20:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _080D5E54
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080D5E54
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080D5E54:
	movs r0, #0
	strb r0, [r4, #0x1d]
_080D5E58:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _080D5E62
	b _080D5A58
_080D5E62:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

