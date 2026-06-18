	.syntax unified
	.set AnimClearAll, 0x08004DC0 + 1
	.set StopArenaBattleMusic, 0x0805BE38 + 1
	.set sub_8031E30, 0x08031E30 + 1
	.set sub_8031E3C, 0x08031E3C + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8059034, 0x08059034 + 1
	.set sub_805A78C, 0x0805A78C + 1
	.set sub_805AACC, 0x0805AACC + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.section .text.sub_80511E0, "ax", %progbits
@ ekrBattleInRoundIdle @ JP 0x080511E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ekrBattleInRoundIdle
	.thumb_func
ekrBattleInRoundIdle:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _08051214 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080511FC
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080511FC:
	ldr r0, _08051218 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bne _08051208
	b _080512FC
_08051208:
	cmp r0, #3
	ble _0805121C
	cmp r0, #4
	bne _08051212
	b _08051308
_08051212:
	b _0805130A
	.align 2, 0
_08051214: .4byte 0x085775CC
_08051218: .4byte 0x0203E11C
_0805121C:
	cmp r0, #0
	blt _0805130A
	ldr r0, _08051264 @ =0x0201FB04
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #2
	bne _0805130A
	bl sub_805BDCC
	cmp r0, #0
	beq _08051308
	ldr r4, _08051268 @ =0x0203E1C4
	ldr r0, _0805126C @ =0x0203E184
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
	ldr r0, _08051270 @ =0x0203E188
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
	ldr r1, _08051274 @ =0x0203E1A8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08051278
	movs r0, #1
	bl sub_8031E30
	b _08051308
	.align 2, 0
_08051264: .4byte 0x0201FB04
_08051268: .4byte 0x0203E1C4
_0805126C: .4byte 0x0203E184
_08051270: .4byte 0x0203E188
_08051274: .4byte 0x0203E1A8
_08051278:
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0805128A
	movs r0, #2
_08051282:
	bl sub_8031E30
	strh r5, [r4, #2]
	b _08051308
_0805128A:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805129C
	bl StopArenaBattleMusic
	movs r0, #4
	b _08051282
_0805129C:
	movs r1, #0
	ldr r0, _080512F4 @ =0x02000000
	ldr r2, [r0]
	ldr r3, [r0, #8]
	ldrb r0, [r2, #0x12]
	cmp r0, #8
	bgt _080512B0
	cmp r0, #6
	blt _080512B0
	movs r1, #1
_080512B0:
	ldrb r0, [r3, #0x12]
	cmp r0, #8
	bgt _080512C0
	cmp r0, #6
	blt _080512C0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080512C0:
	cmp r1, #2
	bne _0805130A
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0x44
	bne _080512D6
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r2, #0
	bl sub_80540C0
_080512D6:
	bl sub_8031E3C
	bl sub_8059034
	bl AnimClearAll
	bl sub_805A78C
	bl sub_805AACC
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, _080512F8 @ =ekrBattleTriggerNewRoundStart
	str r0, [r6, #0xc]
	b _0805130A
	.align 2, 0
_080512F4: .4byte 0x02000000
_080512F8: .4byte 0x080510D5  @ ekrBattleTriggerNewRoundStart
_080512FC:
	ldr r0, _08051318 @ =0x0201FB04
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #1
	bne _0805130A
_08051308:
	movs r5, #1
_0805130A:
	cmp r5, #1
	bne _08051312
	ldr r0, _0805131C @ =ekrBattleOnBattleEnd
	str r0, [r6, #0xc]
_08051312:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051318: .4byte 0x0201FB04
_0805131C: .4byte 0x08051321  @ ekrBattleOnBattleEnd

