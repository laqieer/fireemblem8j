	.syntax unified
	.set BattleGenerateHitScriptedDamage, 0x0802CE00 + 1
	.set BattleUpdateBattleStats, 0x0802B134 + 1
	.set sub_802B554, 0x0802B554 + 1
	.section .text.sub_802CE84, "ax", %progbits
@ sub_802CE84 @ JP 0x0802CE84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CE84
	.thumb_func
sub_802CE84:
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802CEDC @ =0x0203A954
	ldr r3, [r0, #0x18]
	ldr r4, _0802CEE0 @ =0x0203A5E8
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	adds r5, r4, #0
	ldr r6, _0802CEE4 @ =0x0203A604
	cmp r0, #0
	bne _0802CEAE
_0802CE9E:
	stm r4!, {r2}
	adds r3, #4
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	ands r0, r1
	cmp r0, #0
	beq _0802CE9E
_0802CEAE:
	ldr r0, [r3]
	str r0, [r4]
	str r5, [r6]
	ldr r0, [r5]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802CEC4
	b _0802CFE4
_0802CEC4:
	movs r7, #7
_0802CEC6:
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0802CEF0
	ldr r4, _0802CEE8 @ =0x0203A568
	ldr r5, _0802CEEC @ =0x0203A4E8
	b _0802CEF4
	.align 2, 0
_0802CEDC: .4byte 0x0203A954
_0802CEE0: .4byte 0x0203A5E8
_0802CEE4: .4byte 0x0203A604
_0802CEE8: .4byte 0x0203A568
_0802CEEC: .4byte 0x0203A4E8
_0802CEF0:
	ldr r4, _0802CF6C @ =0x0203A4E8
	ldr r5, _0802CF70 @ =0x0203A568
_0802CEF4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleUpdateBattleStats
	adds r0, r4, #0
	bl BattleGenerateHitScriptedDamage
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802B554
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802CF1A
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802CF78
_0802CF1A:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r5, _0802CF74 @ =0x0203A604
	ldr r3, [r5]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r4, #7
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
	ldr r0, _0802CF70 @ =0x0203A568
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802CF64
	ldr r3, [r5]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #4
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_0802CF64:
	ldr r2, [r5]
	ldrb r1, [r2, #6]
	adds r0, r4, #0
	b _0802CFC4
	.align 2, 0
_0802CF6C: .4byte 0x0203A4E8
_0802CF70: .4byte 0x0203A568
_0802CF74: .4byte 0x0203A604
_0802CF78:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0802CF9C
	cmp r1, #0xd
	beq _0802CF9C
	adds r0, r5, #0
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	beq _0802CF9C
	cmp r0, #0xd
	bne _0802CFCE
_0802CF9C:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r3, [r6]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
	ldr r2, [r6]
	ldrb r1, [r2, #6]
	adds r0, r7, #0
_0802CFC4:
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #6]
	b _0802CFE4
_0802CFCE:
	ldr r1, [r6]
	adds r0, r1, #4
	str r0, [r6]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802CFE4
	b _0802CEC6
_0802CFE4:
	ldr r1, _0802CFF0 @ =0x0203A954
	movs r0, #0
	str r0, [r1, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CFF0: .4byte 0x0203A954

