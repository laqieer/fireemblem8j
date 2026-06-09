	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnitStack, 0x08031610 + 1
	.set IsUnitInCurrentRoster, 0x08097740 + 1
	.set LoadPlayerUnitsFromUnitStack, 0x08031660 + 1
	.set PushUnit, 0x0803162C + 1
	.set sub_8012414, 0x08012414 + 1
	.set sub_80976D0, 0x080976D0 + 1
	.set sub_809773C, 0x0809773C + 1
	.section .text.sub_8097A28, "ax", %progbits
@ sub_8097A28 @ JP 0x08097A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097A28
	.thumb_func
sub_8097A28:
	push {r4, r5, r6, r7, lr}
	bl sub_8012414
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08097AEC @ =0x020111CC
	bl InitUnitStack
	movs r5, #1
_08097A3A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08097A74
	ldr r0, [r4]
	cmp r0, #0
	beq _08097A74
	ldr r0, [r4, #0xc]
	ldr r1, _08097AF0 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097A74
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097A74
	adds r0, r4, #0
	bl PushUnit
_08097A74:
	adds r5, #1
	cmp r5, #0x3f
	ble _08097A3A
	movs r5, #1
_08097A7C:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08097AAE
	ldr r0, [r4]
	cmp r0, #0
	beq _08097AAE
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097AA8
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097AAE
_08097AA8:
	adds r0, r4, #0
	bl PushUnit
_08097AAE:
	adds r5, #1
	cmp r5, #0x3f
	ble _08097A7C
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_08097ABA:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08097B12
	ldr r0, [r4]
	cmp r0, #0
	beq _08097B12
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097B12
	adds r0, r4, #0
	bl sub_809773C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097AF8
	ldr r0, [r4, #0xc]
	ldr r1, _08097AF4 @ =0x02000008
	b _08097B0E
	.align 2, 0
_08097AEC: .4byte 0x020111CC
_08097AF0: .4byte 0xFDFFFFFF
_08097AF4: .4byte 0x02000008
_08097AF8:
	cmp r7, r6
	ble _08097B0A
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _08097B12
_08097B0A:
	ldr r0, [r4, #0xc]
	movs r1, #8
_08097B0E:
	orrs r0, r1
	str r0, [r4, #0xc]
_08097B12:
	adds r5, #1
	cmp r5, #0x3f
	ble _08097ABA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

