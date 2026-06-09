	.syntax unified
	.set CanBattleUnitGainLevels, 0x0802B93C + 1
	.set GetItemCostPerUse, 0x080174FC + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_802C570, "ax", %progbits
@ sub_802C570 @ JP 0x0802C570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C570
	.thumb_func
sub_802C570:
	push {r4, lr}
	adds r4, r0, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C582
	movs r0, #0
	b _0802C5D2
_0802C582:
	ldr r0, _0802C598 @ =0x0203A5E8
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802C59C
	movs r0, #1
	b _0802C5D2
	.align 2, 0
_0802C598: .4byte 0x0203A5E8
_0802C59C:
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemCostPerUse
	movs r1, #0x14
	bl __divsi3
	adds r2, r0, #0
	adds r2, #0xa
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C5CA
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
_0802C5CA:
	cmp r2, #0x64
	ble _0802C5D0
	movs r2, #0x64
_0802C5D0:
	adds r0, r2, #0
_0802C5D2:
	pop {r4}
	pop {r1}
	bx r1

