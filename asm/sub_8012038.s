	.syntax unified
	.set BattleHitAdvance, 0x0802D1EC + 1
	.set BattleHitTerminate, 0x0802D1FC + 1
	.set ClearBattleHits, 0x0802AE00 + 1
	.set EvtBattleGenerateBallistaReal, 0x08011FB8 + 1
	.set EvtBattleGenerateReal, 0x08011FA4 + 1
	.set GetItemType, 0x080172F0 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set MakeNewItem, 0x080162E8 + 1
	.set sub_8011FCC, 0x08011FCC + 1
	.set sub_8018370, 0x08018370 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_8059994, 0x08059994 + 1
	.set sub_80599A0, 0x080599A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.section .text.sub_8012038, "ax", %progbits
@ sub_8012038 @ JP 0x08012038 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012038
	.thumb_func
sub_8012038:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #4]
	bl sub_8059994
	movs r0, #0
	mov sl, r0
	cmp r5, #0
	bne _08012074
	movs r1, #1
	mov sl, r1
_08012074:
	ldr r1, _08012080 @ =0x0203A954
	mov r0, sl
	cmp r0, #0
	bne _08012084
	str r5, [r1, #0x18]
	b _08012088
	.align 2, 0
_08012080: .4byte 0x0203A954
_08012084:
	movs r0, #0
	str r0, [r1, #0x18]
_08012088:
	ldrh r0, [r7, #0x1e]
	bl GetItemType
	cmp r0, #4
	beq _08012096
	cmp r6, #0
	beq _080120A6
_08012096:
	adds r0, r7, #0
	movs r1, #0
	bl sub_802CA5C
	mov r0, r8
	bl sub_802CB00
	b _080120BE
_080120A6:
	mov r1, sb
	cmp r1, #0
	bne _080120B6
	adds r0, r7, #0
	mov r1, r8
	bl EvtBattleGenerateReal
	b _080120BE
_080120B6:
	adds r0, r7, #0
	mov r1, r8
	bl EvtBattleGenerateBallistaReal
_080120BE:
	adds r0, r7, #0
	bl GetUnitEquippedWeapon
	ldr r1, _08012104 @ =0x0203A4E8
	adds r2, r1, #0
	adds r2, #0x48
	strh r0, [r2]
	adds r1, #0x4a
	strh r0, [r1]
	mov r0, r8
	bl GetUnitEquippedWeapon
	ldr r1, _08012108 @ =0x0203A568
	adds r2, r1, #0
	adds r2, #0x48
	strh r0, [r2]
	ldr r4, _0801210C @ =0x0000FFFF
	adds r1, #0x4a
	strh r0, [r1]
	ldr r0, _08012110 @ =0x030005F4
	strh r4, [r0]
	cmp r6, #0
	beq _0801219A
	adds r0, r6, #0
	bl GetItemType
	cmp r0, #7
	bgt _08012114
	cmp r0, #5
	bge _0801212C
	cmp r0, #0
	blt _0801219A
	cmp r0, #3
	ble _0801212C
	b _08012178
	.align 2, 0
_08012104: .4byte 0x0203A4E8
_08012108: .4byte 0x0203A568
_0801210C: .4byte 0x0000FFFF
_08012110: .4byte 0x030005F4
_08012114:
	cmp r0, #0xb
	beq _0801212C
	cmp r0, #0xb
	bgt _08012122
	cmp r0, #9
	blt _0801219A
	b _08012178
_08012122:
	cmp r0, #0xc
	beq _08012178
	cmp r0, #0xff
	beq _08012178
	b _0801219A
_0801212C:
	ldr r0, _0801214C @ =0x030005F4
	ldrh r1, [r7, #0x1e]
	strh r1, [r0]
	adds r0, r6, #0
	bl MakeNewItem
	strh r0, [r7, #0x1e]
	mov r0, sb
	cmp r0, #0
	bne _08012150
	adds r0, r7, #0
	mov r1, r8
	bl EvtBattleGenerateReal
	b _08012158
	.align 2, 0
_0801214C: .4byte 0x030005F4
_08012150:
	adds r0, r7, #0
	mov r1, r8
	bl EvtBattleGenerateBallistaReal
_08012158:
	adds r0, r6, #0
	bl MakeNewItem
	ldr r4, _08012174 @ =0x0203A4E8
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r6, #0
	bl MakeNewItem
	adds r4, #0x4a
	strh r0, [r4]
	movs r6, #0
	b _0801219A
	.align 2, 0
_08012174: .4byte 0x0203A4E8
_08012178:
	ldr r0, _08012224 @ =0x0203A4E8
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r6, r1
	adds r1, r0, #0
	adds r1, #0x48
	strh r2, [r1]
	adds r0, #0x4a
	strh r2, [r0]
	cmp r6, #0x80
	bgt _0801219A
	cmp r6, #0x7d
	blt _0801219A
	ldr r1, _08012228 @ =0x0203A4D0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
_0801219A:
	ldr r0, _08012224 @ =0x0203A4E8
	adds r0, #0x6e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0801222C @ =0x0203A568
	adds r0, #0x6e
	strb r1, [r0]
	cmp r6, #0
	beq _080121EE
	mov r0, sl
	cmp r0, #0
	bne _080121EE
	bl ClearBattleHits
	ldr r2, _08012230 @ =0x0203A604
	ldr r1, [r2]
	ldr r0, [r5]
	str r0, [r1]
	ldr r0, [r5]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080121EA
	mov sb, r2
	movs r4, #0x10
_080121D0:
	bl BattleHitAdvance
	adds r5, #4
	mov r0, sb
	ldr r1, [r0]
	ldr r0, [r5]
	str r0, [r1]
	ldr r0, [r5]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	ands r0, r4
	cmp r0, #0
	beq _080121D0
_080121EA:
	bl BattleHitTerminate
_080121EE:
	ldr r1, [sp]
	cmp r1, #0
	bne _08012240
	ldr r5, _08012224 @ =0x0203A4E8
	ldrb r0, [r5, #0x13]
	strb r0, [r7, #0x13]
	ldr r0, _0801222C @ =0x0203A568
	ldrb r0, [r0, #0x13]
	mov r1, r8
	strb r0, [r1, #0x13]
	bl sub_80599A0
	ldr r0, _08012234 @ =0x0203A954
	ldr r1, [sp]
	str r1, [r0, #0x18]
	ldr r4, _08012238 @ =0x030005F4
	ldrh r1, [r4]
	ldr r0, _0801223C @ =0x0000FFFF
	cmp r1, r0
	beq _0801228A
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldrh r1, [r4]
	strh r1, [r0, #0x1e]
	b _0801228A
	.align 2, 0
_08012224: .4byte 0x0203A4E8
_08012228: .4byte 0x0203A4D0
_0801222C: .4byte 0x0203A568
_08012230: .4byte 0x0203A604
_08012234: .4byte 0x0203A954
_08012238: .4byte 0x030005F4
_0801223C: .4byte 0x0000FFFF
_08012240:
	adds r0, r7, #0
	bl sub_8018370
	ldr r4, _0801226C @ =0x03004DF0
	ldr r0, [r4]
	bl sub_80280A0
	ldr r0, [r4]
	bl sub_807A888
	bl sub_807AB0C
	ldrh r0, [r7, #0x1e]
	bl GetItemType
	cmp r0, #4
	beq _08012266
	cmp r6, #0
	beq _08012274
_08012266:
	ldr r1, _08012270 @ =0x0203A954
	movs r0, #3
	b _08012278
	.align 2, 0
_0801226C: .4byte 0x03004DF0
_08012270: .4byte 0x0203A954
_08012274:
	ldr r1, _0801229C @ =0x0203A954
	movs r0, #2
_08012278:
	strb r0, [r1, #0x11]
	ldr r0, [sp, #4]
	bl sub_8011FCC
	ldr r0, _080122A0 @ =0x0203AA90
	ldrb r1, [r7, #0x10]
	strb r1, [r0, #2]
	ldrb r1, [r7, #0x11]
	strb r1, [r0, #3]
_0801228A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801229C: .4byte 0x0203A954
_080122A0: .4byte 0x0203AA90

