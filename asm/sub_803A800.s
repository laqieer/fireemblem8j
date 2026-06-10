	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set MarkWorkingMapEdges, 0x0801A6AC + 1
	.section .text.sub_803A800, "ax", %progbits
@ sub_803A800 @ JP 0x0803A800 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A800
	.thumb_func
sub_803A800:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0803A89C @ =0x03004DF0
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	bl MarkWorkingMapEdges
	ldr r0, _0803A8A0 @ =0x0000FFFF
	strh r0, [r6]
	movs r5, #1
	ldr r0, _0803A8A4 @ =0x0203AA86
	mov r8, r0
_0803A832:
	adds r0, r5, #0
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _0803A888
	ldr r4, [r3]
	cmp r4, #0
	beq _0803A888
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r0, _0803A8A8 @ =0x0202E4E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A888
	ldrb r0, [r4, #4]
	cmp r0, r7
	bne _0803A888
	ldr r1, [r3, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803A8CC
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _0803A87C
	movs r0, #3
	mov r1, r8
	strb r0, [r1]
_0803A87C:
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	strh r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	strh r0, [r6, #2]
_0803A888:
	adds r5, #1
	cmp r5, #0xbf
	ble _0803A832
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	blt _0803A8AC
	movs r0, #1
	b _0803A8E2
	.align 2, 0
_0803A89C: .4byte 0x03004DF0
_0803A8A0: .4byte 0x0000FFFF
_0803A8A4: .4byte 0x0203AA86
_0803A8A8: .4byte 0x0202E4E0
_0803A8AC:
	adds r0, r7, #0
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ldr r1, _0803A8C4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0803A8D8
	ldr r0, _0803A8C8 @ =0x0203AA00
	adds r0, #0x86
	movs r1, #1
	b _0803A8DE
	.align 2, 0
_0803A8C4: .4byte 0x0001000C
_0803A8C8: .4byte 0x0203AA00
_0803A8CC:
	ldr r0, _0803A8D4 @ =0x0203AA00
	adds r0, #0x86
	movs r1, #1
	b _0803A8DE
	.align 2, 0
_0803A8D4: .4byte 0x0203AA00
_0803A8D8:
	ldr r0, _0803A8EC @ =0x0203AA00
	adds r0, #0x86
	movs r1, #4
_0803A8DE:
	strb r1, [r0]
	movs r0, #0
_0803A8E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A8EC: .4byte 0x0203AA00

