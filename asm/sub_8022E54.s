	.syntax unified
	.set BattleGenerateBallistaSimulation, 0x0802A2F0 + 1
	.set BattleGenerateSimulation, 0x0802A2A4 + 1
	.set ChangeActiveUnitFacing, 0x0801F164 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_802C7FC, 0x0802C7FC + 1
	.set sub_803744C, 0x0803744C + 1
	.section .text.sub_8022E54, "ax", %progbits
@ sub_8022E54 @ JP 0x08022E54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022E54
	.thumb_func
sub_8022E54:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08022E8A
	ldr r1, _08022EA8 @ =0x0203A954
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
	bl sub_802C7FC
_08022E8A:
	ldr r1, _08022EA8 @ =0x0203A954
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _08022EB0
	ldr r0, _08022EAC @ =0x03004DF0
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	adds r1, r5, #0
	bl BattleGenerateBallistaSimulation
	b _08022EC4
	.align 2, 0
_08022EA8: .4byte 0x0203A954
_08022EAC: .4byte 0x03004DF0
_08022EB0:
	ldr r0, _08022ED4 @ =0x03004DF0
	ldr r0, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	ldrb r1, [r1, #0x12]
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r3, #0
	bl BattleGenerateSimulation
_08022EC4:
	bl sub_803744C
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022ED4: .4byte 0x03004DF0

