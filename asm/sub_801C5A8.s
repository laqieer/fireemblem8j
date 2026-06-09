	.syntax unified
	.set CanShowUnitStatScreen, 0x0801C590 + 1
	.set Eventinfo_CondFalse_2, 0x08085604 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ShowUnitSprite, 0x080280C4 + 1
	.set StartOrphanMenuAdjusted, 0x0804F924 + 1
	.set TrySwitchViewedUnit, 0x0801D7B0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_8018370, 0x08018370 + 1
	.set sub_801C514, 0x0801C514 + 1
	.set sub_801D180, 0x0801D180 + 1
	.set sub_801DA74, 0x0801DA74 + 1
	.set sub_80279E0, 0x080279E0 + 1
	.set sub_8027AA0, 0x08027AA0 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80890A0, 0x080890A0 + 1
	.set sub_808ABD8, 0x0808ABD8 + 1
	.set sub_808F44C, 0x0808F44C + 1
	.set sub_80A9190, 0x080A9190 + 1
	.set sub_80AD1E0, 0x080AD1E0 + 1
	.section .text.sub_801C5A8, "ax", %progbits
@ sub_801C5A8 @ JP 0x0801C5A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C5A8
	.thumb_func
sub_801C5A8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_801C514
	ldr r4, _0801C5E4 @ =0x085775CC
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C5F0
	ldr r1, _0801C5E8 @ =0x0202BCAC
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl TrySwitchViewedUnit
	ldr r0, _0801C5EC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801C5DC
	b _0801C7A0
_0801C5DC:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0801C7A0
	.align 2, 0
_0801C5E4: .4byte 0x085775CC
_0801C5E8: .4byte 0x0202BCAC
_0801C5EC: .4byte 0x0202BCEC
_0801C5F0:
	bl sub_801DA74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C5FC
	b _0801C7A0
_0801C5FC:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801C674
	ldr r4, _0801C66C @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r5, _0801C670 @ =0x0202E4D4
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801C674
	bl GetUnit
	bl CanShowUnitStatScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C674
	bl sub_807B4B8
	bl sub_808F44C
	movs r0, #0x1f
	bl sub_80890A0
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r6, #0
	bl sub_808ABD8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0801C7CC
	.align 2, 0
_0801C66C: .4byte 0x0202BCAC
_0801C670: .4byte 0x0202E4D4
_0801C674:
	ldr r0, _0801C6B4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801C73C
	ldr r5, _0801C6B8 @ =0x0202BCAC
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _0801C6BC @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl sub_801D180
	cmp r0, #2
	beq _0801C704
	cmp r0, #2
	ble _0801C6C0
	cmp r0, #3
	beq _0801C724
	b _0801C73C
	.align 2, 0
_0801C6B4: .4byte 0x085775CC
_0801C6B8: .4byte 0x0202BCAC
_0801C6BC: .4byte 0x0202E4D4
_0801C6C0:
	cmp r0, #0
	blt _0801C73C
	bl sub_808F44C
	ldr r0, _0801C6FC @ =0x0202BCEC
	ldrh r1, [r5, #0x14]
	strb r1, [r0, #0x12]
	ldrh r1, [r5, #0x16]
	strb r1, [r0, #0x13]
	cmp r4, #0
	beq _0801C6E0
	bl sub_807B4B8
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C6E0:
	ldr r0, _0801C700 @ =0x085C56F4
	movs r3, #0x1c
	ldrsh r1, [r5, r3]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x17
	bl StartOrphanMenuAdjusted
	bl Eventinfo_CondFalse_2
	b _0801C788
	.align 2, 0
_0801C6FC: .4byte 0x0202BCEC
_0801C700: .4byte 0x085C56F4
_0801C704:
	adds r0, r4, #0
	bl sub_8018370
	ldr r0, _0801C720 @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80A9190
	adds r0, r6, #0
	bl sub_8002DE4
	b _0801C7A0
	.align 2, 0
_0801C720: .4byte 0x03004DF0
_0801C724:
	adds r0, r4, #0
	bl sub_8018370
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
	b _0801C7A0
_0801C73C:
	ldr r0, _0801C794 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801C7A0
	ldrh r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0801C7A0
	ldr r2, _0801C798 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801C79C @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C780
	bl sub_807B4B8
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C780:
	bl sub_808F44C
	bl sub_80AD1E0
_0801C788:
	adds r0, r6, #0
	movs r1, #9
	bl Proc_Goto
	b _0801C7CC
	.align 2, 0
_0801C794: .4byte 0x085775CC
_0801C798: .4byte 0x0202BCAC
_0801C79C: .4byte 0x0202E4D4
_0801C7A0:
	bl sub_80279E0
	ldr r1, _0801C7D4 @ =0x0202BCAC
	movs r0, #0x20
	ldrsh r4, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_8027AA0
	lsls r0, r0, #0x18
	movs r2, #0
	cmp r0, #0
	beq _0801C7C4
	movs r2, #3
_0801C7C4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8015AB4
_0801C7CC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C7D4: .4byte 0x0202BCAC

