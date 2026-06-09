	.syntax unified
	.set CountGreenUnits, 0x08018D88 + 1
	.set CountRedUnits, 0x08018D48 + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set sub_80868B0, 0x080868B0 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_800E2C8, "ax", %progbits
@ sub_800E2C8 @ JP 0x0800E2C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E2C8
	.thumb_func
sub_800E2C8:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xa
	bls _0800E2DA
	b _0800E3D4
_0800E2DA:
	lsls r0, r1, #2
	ldr r1, _0800E2E4 @ =_0800E2E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E2E4: .4byte _0800E2E8
_0800E2E8: @ jump table
	.4byte _0800E314 @ case 0
	.4byte _0800E324 @ case 1
	.4byte _0800E334 @ case 2
	.4byte _0800E340 @ case 3
	.4byte _0800E350 @ case 4
	.4byte _0800E356 @ case 5
	.4byte _0800E35C @ case 6
	.4byte _0800E362 @ case 7
	.4byte _0800E38C @ case 8
	.4byte _0800E39C @ case 9
	.4byte _0800E3B0 @ case 10
_0800E314:
	ldr r0, _0800E31C @ =0x030004B0
	ldr r1, _0800E320 @ =0x0202BCEC
	ldrb r1, [r1, #0x1b]
	b _0800E3D2
	.align 2, 0
_0800E31C: .4byte 0x030004B0
_0800E320: .4byte 0x0202BCEC
_0800E324:
	ldr r0, _0800E330 @ =0x030004B0
	adds r1, r2, #0
	adds r1, #0x43
	ldrb r1, [r1]
	b _0800E3D2
	.align 2, 0
_0800E330: .4byte 0x030004B0
_0800E334:
	ldr r0, _0800E33C @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	b _0800E3B6
	.align 2, 0
_0800E33C: .4byte 0x0202BCEC
_0800E340:
	ldr r0, _0800E348 @ =0x030004B0
	ldr r1, _0800E34C @ =0x0202BCEC
	ldrh r1, [r1, #0x10]
	b _0800E3D2
	.align 2, 0
_0800E348: .4byte 0x030004B0
_0800E34C: .4byte 0x0202BCEC
_0800E350:
	bl CountRedUnits
	b _0800E3A2
_0800E356:
	bl CountGreenUnits
	b _0800E3A2
_0800E35C:
	bl sub_80C1E74
	b _0800E390
_0800E362:
	ldr r1, _0800E384 @ =0x0202BCEC
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _0800E37A
	ldrb r1, [r1, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800E3C0
_0800E37A:
	ldr r1, _0800E388 @ =0x030004B0
	movs r0, #0
	str r0, [r1, #0x30]
	b _0800E3D4
	.align 2, 0
_0800E384: .4byte 0x0202BCEC
_0800E388: .4byte 0x030004B0
_0800E38C:
	bl GetPartyGoldAmount
_0800E390:
	ldr r1, _0800E398 @ =0x030004B0
	str r0, [r1, #0x30]
	b _0800E3D4
	.align 2, 0
_0800E398: .4byte 0x030004B0
_0800E39C:
	ldr r0, [r2, #0x30]
	bl sub_80868B0
_0800E3A2:
	ldr r1, _0800E3AC @ =0x030004B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1, #0x30]
	b _0800E3D4
	.align 2, 0
_0800E3AC: .4byte 0x030004B0
_0800E3B0:
	ldr r0, _0800E3C8 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
_0800E3B6:
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0800E3D0
_0800E3C0:
	ldr r1, _0800E3CC @ =0x030004B0
	movs r0, #1
	str r0, [r1, #0x30]
	b _0800E3D4
	.align 2, 0
_0800E3C8: .4byte 0x0202BCEC
_0800E3CC: .4byte 0x030004B0
_0800E3D0:
	ldr r0, _0800E3DC @ =0x030004B0
_0800E3D2:
	str r1, [r0, #0x30]
_0800E3D4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E3DC: .4byte 0x030004B0

