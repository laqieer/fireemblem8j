	.syntax unified
	.set PidStatsSubFavval08, 0x080A9320 + 1
	.section .text.sub_80184D4, "ax", %progbits
@ ClearActiveFactionGrayedStates @ JP 0x080184D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearActiveFactionGrayedStates
	.thumb_func
ClearActiveFactionGrayedStates:
	push {r4, r5, r6, lr}
	ldr r0, _0801855C @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0801851E
	movs r4, #1
	ldr r5, _08018560 @ =0x085C2A50
_080184E2:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018518
	ldr r3, [r2]
	cmp r3, #0
	beq _08018518
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08018518
	ldr r0, [r2, #0xc]
	ldr r1, _08018564 @ =0x0001000E
	ands r0, r1
	cmp r0, #0
	bne _08018518
	ldrb r0, [r3, #4]
	bl PidStatsSubFavval08
_08018518:
	adds r4, #1
	cmp r4, #0x3f
	ble _080184E2
_0801851E:
	ldr r1, _0801855C @ =0x0202BCEC
	ldrb r0, [r1, #0xf]
	adds r2, r0, #1
	adds r0, #0x40
	cmp r2, r0
	bge _08018556
	ldr r6, _08018560 @ =0x085C2A50
	movs r5, #0xff
	ldr r4, _08018568 @ =0xFFFFFBBD
	adds r3, r1, #0
_08018532:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _0801854C
	ldr r0, [r1]
	cmp r0, #0
	beq _0801854C
	ldr r0, [r1, #0xc]
	ands r0, r4
	str r0, [r1, #0xc]
_0801854C:
	adds r2, #1
	ldrb r0, [r3, #0xf]
	adds r0, #0x40
	cmp r2, r0
	blt _08018532
_08018556:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801855C: .4byte 0x0202BCEC
_08018560: .4byte 0x085C2A50
_08018564: .4byte 0x0001000E
_08018568: .4byte 0xFFFFFBBD

