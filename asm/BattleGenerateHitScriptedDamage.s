	.syntax unified
	.section .text.BattleGenerateHitScriptedDamage, "ax", %progbits
@ BattleGenerateHitScriptedDamage @ JP 0x0802CE00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleGenerateHitScriptedDamage
	.thumb_func
BattleGenerateHitScriptedDamage:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0802CE44 @ =0x0203A4D0
	movs r0, #0
	strh r0, [r2, #4]
	ldr r0, _0802CE48 @ =0x0203A604
	ldr r3, [r0]
	ldr r0, [r3]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802CE7C
	movs r0, #3
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0802CE4C
	ldrh r0, [r2, #6]
	ldrh r1, [r2, #8]
	subs r0, r0, r1
	strh r0, [r2, #4]
	ldr r0, [r3]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802CE52
	movs r0, #4
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	b _0802CE50
	.align 2, 0
_0802CE44: .4byte 0x0203A4D0
_0802CE48: .4byte 0x0203A604
_0802CE4C:
	movs r0, #3
	ldrsb r0, [r3, r0]
_0802CE50:
	strh r0, [r2, #4]
_0802CE52:
	adds r1, r2, #0
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, #0x7f
	ble _0802CE60
	movs r0, #0x7f
	strh r0, [r1, #4]
_0802CE60:
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0802CE6C
	movs r0, #0
	strh r0, [r1, #4]
_0802CE6C:
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0802CE7C
	adds r1, r4, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_0802CE7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

