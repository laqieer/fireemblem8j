	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set AiSimulateBestBattleAgainstTarget, 0x0803DC54 + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_80379F4, 0x080379F4 + 1
	.set sub_8037B04, 0x08037B04 + 1
	.set sub_803AC5C, 0x0803AC5C + 1
	.set sub_803D810, 0x0803D810 + 1
	.set sub_803D928, 0x0803D928 + 1
	.set sub_80D65D8, 0x080D65D8 + 1
	.section .text.sub_803D648, "ax", %progbits
@ sub_803D648 @ JP 0x0803D648 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803D648
	.thumb_func
sub_803D648:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r2, sp, #0x18
	movs r5, #0
	strb r5, [r2, #2]
	str r5, [r2, #8]
	ldr r6, _0803D800 @ =0x03004DF0
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0803D6AE
	ldr r4, _0803D804 @ =0x0202E4DC
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80379F4
	adds r1, r0, #0
	cmp r1, #0
	bne _0803D77A
	ldr r0, [r6]
	bl sub_8037B04
_0803D6AE:
	ldr r0, _0803D808 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	movs r1, #0
	mov sb, r1
	ldr r1, [r6]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803D77A
	mov sl, r6
_0803D6C4:
	mov r2, sb
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq _0803D760
	mov r3, sl
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D760
	add r0, sp, #0xc
	mov r4, sb
	strh r4, [r0, #4]
	movs r6, #1
_0803D6E8:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803D75A
	ldr r1, [r4]
	cmp r1, #0
	beq _0803D75A
	ldr r1, [r4, #0xc]
	ldr r2, _0803D80C @ =0x00010025
	ands r1, r2
	cmp r1, #0
	bne _0803D75A
	ldr r7, [sp, #0x24]
	bl sub_80D65D8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D75A
	mov r1, sl
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_803AC5C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D75A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D810
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl AiSimulateBestBattleAgainstTarget
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D75A
	ldr r2, [sp, #0x14]
	mov r3, r8
	ldr r1, [r3, #8]
	cmp r2, r1
	blo _0803D75A
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, sb
	mov r4, r8
	strh r7, [r4, #4]
_0803D75A:
	adds r6, #1
	cmp r6, #0xbf
	ble _0803D6E8
_0803D760:
	ldr r1, [sp, #0x28]
	mov sb, r1
	cmp r1, #4
	bgt _0803D77A
	mov r2, sl
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803D6C4
_0803D77A:
	ldr r1, _0803D800 @ =0x03004DF0
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0803D7B4
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl sub_803D928
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _0803D7B4
	ldr r2, [sp, #0x14]
	mov r4, r8
	ldr r1, [r4, #8]
	cmp r2, r1
	blo _0803D7B4
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
_0803D7B4:
	mov r2, r8
	ldr r1, [r2, #8]
	cmp r1, #0
	bne _0803D7C2
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq _0803D7EE
_0803D7C2:
	mov r4, r8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r2, r1
	beq _0803D7EE
	ldr r0, _0803D800 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8037B04
_0803D7EE:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D800: .4byte 0x03004DF0
_0803D804: .4byte 0x0202E4DC
_0803D808: .4byte 0x0202E4E0
_0803D80C: .4byte 0x00010025

