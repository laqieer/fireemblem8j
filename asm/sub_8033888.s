	.syntax unified
	.set CanShowUnitStatScreen, 0x0801C590 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set TrySwitchViewedUnit, 0x0801D7B0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_8018370, 0x08018370 + 1
	.set sub_801C514, 0x0801C514 + 1
	.set sub_801D180, 0x0801D180 + 1
	.set sub_801DA74, 0x0801DA74 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80890A0, 0x080890A0 + 1
	.set sub_808ABD8, 0x0808ABD8 + 1
	.set sub_808F44C, 0x0808F44C + 1
	.set sub_80AD1F4, 0x080AD1F4 + 1
	.section .text.sub_8033888, "ax", %progbits
@ sub_8033888 @ JP 0x08033888 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033888
	.thumb_func
sub_8033888:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_801C514
	bl sub_801DA74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803389C
	b _08033AEC
_0803389C:
	ldr r0, _080338D0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080338DC
	ldr r1, _080338D4 @ =0x0202BCAC
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl TrySwitchViewedUnit
	ldr r0, _080338D8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080338C8
	b _08033AEC
_080338C8:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08033AEC
	.align 2, 0
_080338D0: .4byte 0x085775CC
_080338D4: .4byte 0x0202BCAC
_080338D8: .4byte 0x0202BCEC
_080338DC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803394C
	ldr r4, _08033944 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r6, _08033948 @ =0x0202E4D4
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803394C
	bl GetUnit
	bl CanShowUnitStatScreen
	cmp r0, #0
	beq _0803394C
	bl sub_807B4B8
	bl sub_808F44C
	movs r0, #0x1f
	bl sub_80890A0
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r5, #0
	bl sub_808ABD8
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _08033AFC
	.align 2, 0
_08033944: .4byte 0x0202BCAC
_08033948: .4byte 0x0202E4D4
_0803394C:
	ldr r0, _08033978 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033984
	bl sub_808F44C
	ldr r4, _0803397C @ =0x0202BCEC
	ldr r1, _08033980 @ =0x0202BCAC
	ldrh r0, [r1, #0x14]
	strb r0, [r4, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	adds r4, #0x41
	ldrb r0, [r4]
	b _08033A46
	.align 2, 0
_08033978: .4byte 0x085775CC
_0803397C: .4byte 0x0202BCEC
_08033980: .4byte 0x0202BCAC
_08033984:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0803398E
	b _08033AC4
_0803398E:
	ldr r2, _080339C0 @ =0x0202BCAC
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _080339C4 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl sub_801D180
	cmp r0, #4
	bls _080339B6
	b _08033AC4
_080339B6:
	lsls r0, r0, #2
	ldr r1, _080339C8 @ =_080339CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080339C0: .4byte 0x0202BCAC
_080339C4: .4byte 0x0202E4D4
_080339C8: .4byte _080339CC
_080339CC: @ jump table
	.4byte _080339E0 @ case 0
	.4byte _080339E0 @ case 1
	.4byte _08033A58 @ case 2
	.4byte _08033AA0 @ case 3
	.4byte _08033A80 @ case 4
_080339E0:
	bl sub_808F44C
	ldr r3, _08033A2C @ =0x0202BCEC
	ldr r2, _08033A30 @ =0x0202BCAC
	ldrh r0, [r2, #0x14]
	strb r0, [r3, #0x12]
	ldrh r0, [r2, #0x16]
	strb r0, [r3, #0x13]
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08033A34 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	bgt _08033A38
	cmp r0, #6
	blt _08033A38
	adds r0, r3, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033A20
	movs r0, #0x6a
	bl m4aSongNumStart
_08033A20:
	adds r0, r5, #0
	movs r1, #0x3c
	bl Proc_Goto
	b _08033AFC
	.align 2, 0
_08033A2C: .4byte 0x0202BCEC
_08033A30: .4byte 0x0202BCAC
_08033A34: .4byte 0x0202E4D8
_08033A38:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08033A54 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
_08033A46:
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033AFC
	movs r0, #0x69
	bl m4aSongNumStart
	b _08033AFC
	.align 2, 0
_08033A54: .4byte 0x0202BCEC
_08033A58:
	adds r0, r4, #0
	bl sub_8018370
	ldr r0, _08033A7C @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _08033AB4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08033AFC
	.align 2, 0
_08033A7C: .4byte 0x03004DF0
_08033A80:
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _08033AA0
	ldr r0, _08033A9C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033AFC
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08033AFC
	.align 2, 0
_08033A9C: .4byte 0x0202BCEC
_08033AA0:
	adds r0, r4, #0
	bl sub_8018370
	ldr r0, _08033AC0 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
_08033AB4:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08033AFC
	.align 2, 0
_08033AC0: .4byte 0x03004DF0
_08033AC4:
	ldr r0, _08033AE8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08033AEC
	bl sub_808F44C
	adds r0, r5, #0
	bl sub_80AD1F4
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _08033AFC
	.align 2, 0
_08033AE8: .4byte 0x085775CC
_08033AEC:
	ldr r1, _08033B04 @ =0x0202BCAC
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r3, #0x22
	ldrsh r1, [r1, r3]
	movs r2, #0
	bl sub_8015AB4
_08033AFC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033B04: .4byte 0x0202BCAC

