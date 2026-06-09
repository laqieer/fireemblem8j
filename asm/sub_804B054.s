	.syntax unified
	.set BattleGenerateSimulation, 0x0802A2A4 + 1
	.set EquipUnitItemSlot, 0x08016968 + 1
	.set GetUnit, 0x08019108 + 1
	.set LinkArenaBattleMap_RestoreUnitItems, 0x0804A0B4 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_80373E4, 0x080373E4 + 1
	.set sub_803744C, 0x0803744C + 1
	.section .text.sub_804B054, "ax", %progbits
@ sub_804B054 @ JP 0x0804B054 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B054
	.thumb_func
sub_804B054:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, _0804B0DC @ =0x03001810
	ldr r2, _0804B0E0 @ =0x0203DD8C
	mov r8, r2
	ldrb r0, [r2, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	mov sb, r0
	mov r1, r8
	ldrb r0, [r1, #5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r4, [r0, r2]
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0804B152
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	adds r0, #1
	ldr r1, _0804B0E4 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _0804B0C0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0804B0C0:
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0804B0EC
	ldr r0, _0804B0E8 @ =0x03004DF0
	ldr r0, [r0]
	bl LinkArenaBattleMap_RestoreUnitItems
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	b _0804B152
	.align 2, 0
_0804B0DC: .4byte 0x03001810
_0804B0E0: .4byte 0x0203DD8C
_0804B0E4: .4byte 0x0202E4D8
_0804B0E8: .4byte 0x03004DF0
_0804B0EC:
	ldr r7, _0804B140 @ =0x03004DF0
	ldr r0, [r7]
	mov r2, r8
	ldrb r1, [r2, #7]
	bl EquipUnitItemSlot
	ldr r4, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r4, r0
	cmp r4, #0
	bne _0804B144
	adds r0, r6, #0
	bl sub_80373E4
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #2
	bne _0804B116
	movs r2, #1
	mov sl, r2
_0804B116:
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	add r2, sl
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	ldr r0, [sp, #4]
	adds r3, r3, r0
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	bl BattleGenerateSimulation
	bl sub_803744C
	ldr r0, [r7]
	bl LinkArenaBattleMap_RestoreUnitItems
	adds r0, r6, #0
	bl sub_8002DE4
	b _0804B152
	.align 2, 0
_0804B140: .4byte 0x03004DF0
_0804B144:
	ldr r0, [r7]
	bl LinkArenaBattleMap_RestoreUnitItems
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_0804B152:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

