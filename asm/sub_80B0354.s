	.syntax unified
	.set AddExtraMenuOption, 0x080B0340 + 1
	.set AddMainMenuOption, 0x080B032C + 1
	.set IsExtraBonusClaimEnabled, 0x080A7E60 + 1
	.set IsExtraSupportViewerEnabled, 0x080A7D70 + 1
	.set sub_80A7D34, 0x080A7D34 + 1
	.set sub_80A7D6C, 0x080A7D6C + 1
	.set sub_80A7E30, 0x080A7E30 + 1
	.section .text.sub_80B0354, "ax", %progbits
@ sub_80B0354 @ JP 0x080B0354 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0354
	.thumb_func
sub_80B0354:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x31
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	adds r0, #0x14
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B0376
	adds r0, r4, #0
	movs r1, #1
	bl AddMainMenuOption
_080B0376:
	movs r1, #0
	adds r7, r4, #0
	adds r7, #0x32
	adds r6, r4, #0
	adds r6, #0x33
	adds r2, r4, #0
	adds r2, #0x37
_080B0384:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080B038E
	adds r5, #1
_080B038E:
	adds r1, #1
	cmp r1, #2
	ble _080B0384
	cmp r5, #0
	ble _080B03B4
	adds r0, r4, #0
	movs r1, #2
	bl AddMainMenuOption
	cmp r5, #2
	bgt _080B03AC
	adds r0, r4, #0
	movs r1, #4
	bl AddMainMenuOption
_080B03AC:
	adds r0, r4, #0
	movs r1, #8
	bl AddMainMenuOption
_080B03B4:
	cmp r5, #2
	bgt _080B03C0
	adds r0, r4, #0
	movs r1, #0x10
	bl AddMainMenuOption
_080B03C0:
	movs r0, #0
	strb r0, [r7]
	strb r0, [r6]
	bl sub_80A7D34
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B03D8
	adds r0, r4, #0
	movs r1, #1
	bl AddExtraMenuOption
_080B03D8:
	bl sub_80A7D6C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B03EA
	adds r0, r4, #0
	movs r1, #2
	bl AddExtraMenuOption
_080B03EA:
	bl IsExtraSupportViewerEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B03FC
	adds r0, r4, #0
	movs r1, #4
	bl AddExtraMenuOption
_080B03FC:
	bl sub_80A7E30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B040E
	adds r0, r4, #0
	movs r1, #0x10
	bl AddExtraMenuOption
_080B040E:
	bl IsExtraBonusClaimEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0420
	adds r0, r4, #0
	movs r1, #0x20
	bl AddExtraMenuOption
_080B0420:
	ldrb r0, [r7]
	cmp r0, #0
	beq _080B043C
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080B043C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

