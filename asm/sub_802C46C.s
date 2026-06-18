	.syntax unified
	.set CanBattleUnitGainLevels, 0x0802B93C + 1
	.set ModifyUnitSpecialExp, 0x0802C428 + 1
	.set sub_802C2B0, 0x0802C2B0 + 1
	.section .text.sub_802C46C, "ax", %progbits
@ GetBattleUnitExpGain @ JP 0x0802C46C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetBattleUnitExpGain
	.thumb_func
GetBattleUnitExpGain:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C49A
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802C49A
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0802C49E
_0802C49A:
	movs r0, #0
	b _0802C4E6
_0802C49E:
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802C4B0
	movs r0, #1
	b _0802C4E6
_0802C4B0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802C2B0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetUnitKillExpBonus
	ldr r1, [sp]
	adds r1, r1, r0
	str r1, [sp]
	cmp r1, #0x64
	ble _0802C4D0
	movs r0, #0x64
	str r0, [sp]
_0802C4D0:
	ldr r0, [sp]
	cmp r0, #0
	bgt _0802C4DA
	movs r0, #1
	str r0, [sp]
_0802C4DA:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl ModifyUnitSpecialExp
	ldr r0, [sp]
_0802C4E6:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

