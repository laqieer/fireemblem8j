	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnitStack, 0x08031610 + 1
	.set LoadPlayerUnitsFromUnitStack, 0x08031660 + 1
	.set PushUnit, 0x0803162C + 1
	.section .text.sub_80979B8, "ax", %progbits
@ sub_80979B8 @ JP 0x080979B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80979B8
	.thumb_func
sub_80979B8:
	push {r4, lr}
	ldr r0, _08097A20 @ =0x020111CC
	bl InitUnitStack
	movs r4, #1
_080979C2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080979E4
	ldr r0, [r2]
	cmp r0, #0
	beq _080979E4
	ldr r0, [r2, #0xc]
	ldr r1, _08097A24 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080979E4
	adds r0, r2, #0
	bl PushUnit
_080979E4:
	adds r4, #1
	cmp r4, #0x3f
	ble _080979C2
	movs r4, #1
_080979EC:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08097A0E
	ldr r0, [r2]
	cmp r0, #0
	beq _08097A0E
	ldr r0, [r2, #0xc]
	ldr r1, _08097A24 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _08097A0E
	adds r0, r2, #0
	bl PushUnit
_08097A0E:
	adds r4, #1
	cmp r4, #0x3f
	ble _080979EC
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097A20: .4byte 0x020111CC
_08097A24: .4byte 0x0001000C

