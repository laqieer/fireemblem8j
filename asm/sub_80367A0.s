	.syntax unified
	.set BattleForecastHitCountUpdate, 0x0803676C + 1
	.set GetItemUses, 0x0801732C + 1
	.set IsItemEffectiveAgainst, 0x08016994 + 1
	.set IsUnitEffectiveAgainst, 0x08016A30 + 1
	.set sub_802AF00, 0x0802AF00 + 1
	.section .text.sub_80367A0, "ax", %progbits
@ sub_80367A0 @ JP 0x080367A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80367A0
	.thumb_func
sub_80367A0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r7, _08036910 @ =0x0203A4E8
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #8]
	ldr r0, _08036914 @ =0x0203A568
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #0xc]
	add r1, sp, #4
	mov r0, sp
	bl sub_802AF00
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x50
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _080367F8
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803686E
_080367F8:
	add r6, sp, #8
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl BattleForecastHitCountUpdate
	mov r0, r8
	cmp r0, #0
	beq _08036818
	ldr r0, [sp]
	cmp r0, r7
	bne _08036818
	adds r1, r4, #0
	adds r2, r6, #0
	bl BattleForecastHitCountUpdate
_08036818:
	ldr r4, _08036910 @ =0x0203A4E8
	ldr r6, _08036914 @ =0x0203A568
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsUnitEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08036832
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_08036832:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r1, r6, #0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803684C
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_0803684C:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0803686E
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803686E
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_0803686E:
	adds r4, r5, #0
	adds r4, #0x51
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x53
	strb r0, [r1]
	ldr r6, _08036914 @ =0x0203A568
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne _08036898
	adds r0, r6, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08036902
_08036898:
	add r5, sp, #0xc
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl BattleForecastHitCountUpdate
	mov r0, r8
	cmp r0, #0
	beq _080368B8
	ldr r0, [sp]
	cmp r0, r6
	bne _080368B8
	adds r1, r4, #0
	adds r2, r5, #0
	bl BattleForecastHitCountUpdate
_080368B8:
	ldr r4, _08036914 @ =0x0203A568
	ldr r5, _08036910 @ =0x0203A4E8
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsUnitEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080368CE
	movs r0, #1
	strb r0, [r7]
_080368CE:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r1, r5, #0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080368E4
	movs r0, #1
	strb r0, [r7]
_080368E4:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08036902
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08036902
	movs r0, #1
	strb r0, [r7]
_08036902:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036910: .4byte 0x0203A4E8
_08036914: .4byte 0x0203A568

