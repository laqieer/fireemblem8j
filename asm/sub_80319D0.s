	.syntax unified
	.set UnitCheckStatCaps, 0x08017EDC + 1
	.set UnitLoadStatsFromChracter, 0x08017B54 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8017A5C, 0x08017A5C + 1
	.set sub_8017E3C, 0x08017E3C + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8019040, 0x08019040 + 1
	.section .text.sub_80319D0, "ax", %progbits
@ sub_80319D0 @ JP 0x080319D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80319D0
	.thumb_func
sub_80319D0:
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _08031A4C @ =0x0203A90C
	mov r1, sp
	movs r3, #0
	movs r0, #0xfd
	strb r0, [r1]
	ldr r4, _08031A50 @ =0x0203A8EC
	ldrb r0, [r4, #0x10]
	strb r0, [r1, #1]
	ldrb r0, [r1, #3]
	movs r2, #7
	rsbs r2, r2, #0
	ands r2, r0
	strb r2, [r1, #3]
	mov r5, sp
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #3
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
	mov r2, sp
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #3]
	mov r0, sp
	strb r3, [r0, #0xc]
	strb r3, [r0, #0xd]
	strb r3, [r0, #0xe]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x10]
	strb r3, [r0, #0x10]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x12]
	strb r3, [r0, #0x13]
	adds r0, r6, #0
	bl sub_801759C
	movs r0, #0x80
	strb r0, [r6, #0xb]
	adds r0, r6, #0
	mov r1, sp
	bl sub_8017A5C
	ldr r1, [r6]
	adds r0, r6, #0
	bl UnitLoadStatsFromChracter
	movs r4, #8
	ldrsb r4, [r6, r4]
	ldr r0, _08031A54 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031A58
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	b _08031A5E
	.align 2, 0
_08031A4C: .4byte 0x0203A90C
_08031A50: .4byte 0x0203A8EC
_08031A54: .4byte 0x0202BCEC
_08031A58:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
_08031A5E:
	movs r1, #0xa
	bl __divsi3
	strb r0, [r6, #8]
	adds r0, r6, #0
	bl sub_8017E3C
	strb r4, [r6, #8]
	movs r2, #0
	adds r3, r6, #0
	adds r3, #0x28
	movs r4, #0xb5
_08031A76:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _08031A80
	strb r4, [r1]
_08031A80:
	adds r2, #1
	cmp r2, #7
	ble _08031A76
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bgt _08031A92
	movs r0, #1
	strb r0, [r6, #8]
_08031A92:
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0x14
	ble _08031A9E
	movs r0, #0x14
	strb r0, [r6, #8]
_08031A9E:
	adds r0, r6, #0
	bl UnitCheckStatCaps
	adds r0, r6, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8019040
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

