	.syntax unified
	.set AiSimulateBattleAgainstTargetAtPosition, 0x0803DE58 + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804A1CC, 0x0804A1CC + 1
	.set sub_804BC1C, 0x0804BC1C + 1
	.set sub_804BCCC, 0x0804BCCC + 1
	.section .text.sub_804BCFC, "ax", %progbits
@ sub_804BCFC @ JP 0x0804BCFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BCFC
	.thumb_func
sub_804BCFC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl sub_804BC1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BD28
	b _0804BF16
_0804BD28:
	ldr r0, _0804BE68 @ =0x0203AA00
	adds r0, #0x7d
	movs r1, #0xe
	strb r1, [r0]
	ldr r0, _0804BE6C @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #6
	ldr r1, [sp, #0x10]
	adds r1, #0x2c
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x10]
	adds r2, #0x30
	str r2, [sp, #0x38]
	cmp r4, r0
	blt _0804BD50
	b _0804BEF8
_0804BD50:
	ldr r0, _0804BE70 @ =0x0202BE40
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, _0804BE74 @ =0x03004DF0
	str r2, [r0]
	ldr r1, [r2, #0xc]
	ldr r0, _0804BE78 @ =0x00010004
	ands r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #6
	str r0, [sp, #0x30]
	adds r4, #1
	str r4, [sp, #0x28]
	cmp r1, #0
	beq _0804BD76
	b _0804BEEE
_0804BD76:
	ldr r0, [r2]
	cmp r0, #0
	bne _0804BD7E
	b _0804BEEE
_0804BD7E:
	movs r5, #0
_0804BD80:
	ldr r0, _0804BE74 @ =0x03004DF0
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x2c]
	cmp r4, #0
	bne _0804BD9A
	b _0804BEE6
_0804BD9A:
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804BDAA
	b _0804BEE6
_0804BDAA:
	mov sl, r5
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804BDBC
	b _0804BEE6
_0804BDBC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _0804BDCC
	b _0804BEE6
_0804BDCC:
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _0804BDDA
	movs r0, #2
	mov r8, r0
_0804BDDA:
	adds r0, r6, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _0804BDEC
	movs r0, #1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0804BDEC:
	add r0, sp, #4
	strh r5, [r0, #4]
	ldr r0, _0804BE7C @ =0x0203DD8C
	ldrb r0, [r0, #2]
	lsls r0, r0, #6
	mov sb, r0
	mov r5, sb
	adds r5, #1
	adds r0, #6
	cmp r5, r0
	bge _0804BEE6
	add r6, sp, #4
	ldr r7, _0804BE80 @ =0x0300182C
	mov r0, r8
	movs r2, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
_0804BE12:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, _0804BE78 @ =0x00010004
	ands r1, r0
	cmp r1, #0
	bne _0804BEDC
	ldr r0, [r4]
	cmp r0, #0
	beq _0804BEDC
	strb r5, [r6, #2]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0804BE8C
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bhi _0804BE8C
	str r0, [sp, #0x18]
	ldr r0, _0804BE70 @ =0x0202BE40
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r2, r8
	cmp r2, #3
	bne _0804BE84
	movs r0, #3
	adds r1, r4, #0
	bl sub_804BCCC
	b _0804BE86
	.align 2, 0
_0804BE68: .4byte 0x0203AA00
_0804BE6C: .4byte 0x0202BCEC
_0804BE70: .4byte 0x0202BE40
_0804BE74: .4byte 0x03004DF0
_0804BE78: .4byte 0x00010004
_0804BE7C: .4byte 0x0203DD8C
_0804BE80: .4byte 0x0300182C
_0804BE84:
	movs r0, #1
_0804BE86:
	strb r0, [r7, #2]
	mov r0, sl
	strb r0, [r7, #3]
_0804BE8C:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0804BEDC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r2, r0
	bhi _0804BEDC
	str r0, [sp, #0x18]
	ldr r0, _0804BED0 @ =0x0202BE40
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r0, r8
	cmp r0, #3
	bne _0804BED4
	movs r0, #3
	adds r1, r4, #0
	bl sub_804BCCC
	strb r0, [r7, #2]
	b _0804BED8
	.align 2, 0
_0804BED0: .4byte 0x0202BE40
_0804BED4:
	movs r1, #2
	strb r1, [r7, #2]
_0804BED8:
	mov r2, sl
	strb r2, [r7, #3]
_0804BEDC:
	adds r5, #1
	mov r0, sb
	adds r0, #6
	cmp r5, r0
	blt _0804BE12
_0804BEE6:
	ldr r5, [sp, #0x2c]
	cmp r5, #4
	bgt _0804BEEE
	b _0804BD80
_0804BEEE:
	ldr r4, [sp, #0x28]
	ldr r0, [sp, #0x30]
	cmp r4, r0
	bge _0804BEF8
	b _0804BD50
_0804BEF8:
	ldr r2, _0804BF28 @ =0x0203DD90
	ldr r1, [sp, #0x38]
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	ldr r3, [sp, #0x34]
	bl sub_804A1CC
	ldr r0, _0804BF2C @ =0x0300182C
	add r2, sp, #0x20
	ldrb r2, [r2]
	strb r2, [r0, #1]
	ldr r0, [sp, #0x10]
	bl sub_8002DE4
_0804BF16:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF28: .4byte 0x0203DD90
_0804BF2C: .4byte 0x0300182C

