	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitSupporterCount, 0x0802815C + 1
	.set GetUnitTotalSupportLevel, 0x080281F8 + 1
	.set UnitGainSupportExp, 0x08028224 + 1
	.set sub_8028188, 0x08028188 + 1
	.section .text.sub_80283C8, "ax", %progbits
@ sub_80283C8 @ JP 0x080283C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80283C8
	.thumb_func
sub_80283C8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08028468 @ =0x0202BCEC
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	beq _080284B4
	ldrb r1, [r1, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080284B4
	movs r4, #1
_080283E4:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov sb, r4
	cmp r5, #0
	beq _080284AE
	ldr r0, [r5]
	cmp r0, #0
	beq _080284AE
	ldr r0, [r5, #0xc]
	ldr r1, _0802846C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080284AE
	adds r0, r5, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _080284AE
	adds r0, r5, #0
	bl GetUnitSupporterCount
	mov r8, r0
	movs r7, #0
	cmp r7, r8
	bge _080284AE
_0802841C:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8028188
	adds r4, r0, #0
	cmp r4, #0
	beq _080284A8
	ldr r1, [r4, #0xc]
	ldr r0, _0802846C @ =0x0001000C
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0
	bne _080284A8
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	mov ip, r1
	cmp r0, #0
	bne _080284A8
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08028454
	subs r1, r0, r2
_08028454:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08028470
	adds r0, r1, r2
	b _08028474
	.align 2, 0
_08028468: .4byte 0x0202BCEC
_0802846C: .4byte 0x0001000C
_08028470:
	subs r0, r0, r3
	adds r0, r1, r0
_08028474:
	cmp r0, #0
	beq _0802847E
	cmp r0, #1
	beq _08028486
	b _080284A8
_0802847E:
	ldrb r0, [r5, #0x1b]
	cmp r0, ip
	bne _080284A8
	b _08028496
_08028486:
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080284A8
	ands r6, r1
	cmp r6, #0
	bne _080284A8
_08028496:
	adds r0, r4, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _080284A8
	adds r0, r5, #0
	adds r1, r7, #0
	bl UnitGainSupportExp
_080284A8:
	adds r7, #1
	cmp r7, r8
	blt _0802841C
_080284AE:
	mov r4, sb
	cmp r4, #0x3f
	ble _080283E4
_080284B4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

