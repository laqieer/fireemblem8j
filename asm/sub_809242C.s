	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnitStack, 0x08031610 + 1
	.set IsUnitInCurrentRoster, 0x08097740 + 1
	.set LoadPlayerUnitsFromUnitStack, 0x08031660 + 1
	.set PushUnit, 0x0803162C + 1
	.section .text.sub_809242C, "ax", %progbits
@ sub_809242C @ JP 0x0809242C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809242C
	.thumb_func
sub_809242C:
	push {r4, r5, lr}
	ldr r0, _08092498 @ =0x0200E158
	bl InitUnitStack
	movs r5, #1
_08092436:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0809245A
	ldr r0, [r4]
	cmp r0, #0
	beq _0809245A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809245A
	adds r0, r4, #0
	bl PushUnit
_0809245A:
	adds r5, #1
	cmp r5, #0x3f
	ble _08092436
	movs r5, #1
_08092462:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08092486
	ldr r0, [r4]
	cmp r0, #0
	beq _08092486
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092486
	adds r0, r4, #0
	bl PushUnit
_08092486:
	adds r5, #1
	cmp r5, #0x3f
	ble _08092462
	bl LoadPlayerUnitsFromUnitStack
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092498: .4byte 0x0200E158

