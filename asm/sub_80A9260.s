	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80A9478, 0x080A9478 + 1
	.section .text.sub_80A9260, "ax", %progbits
@ PidStatsAddSquaresMoved @ JP 0x080A9260 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PidStatsAddSquaresMoved
	.thumb_func
PidStatsAddSquaresMoved:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A92B4
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A92B4
	lsls r1, r4, #4
	ldr r0, _080A92BC @ =0x0203E880
	adds r3, r1, r0
	cmp r3, #0
	beq _080A92B4
	ldrb r4, [r3, #7]
	lsrs r1, r4, #6
	ldrb r0, [r3, #8]
	lsls r0, r0, #2
	orrs r0, r1
	adds r2, r0, r5
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble _080A929A
	adds r2, r0, #0
_080A929A:
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #6
	movs r1, #0x3f
	ands r1, r4
	orrs r1, r0
	strb r1, [r3, #7]
	lsrs r0, r2, #2
	strb r0, [r3, #8]
	adds r0, r6, #0
	movs r1, #2
	bl sub_80A9478
_080A92B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A92BC: .4byte 0x0203E880

