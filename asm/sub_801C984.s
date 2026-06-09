	.syntax unified
	.set CanShowUnitStatScreen, 0x0801C590 + 1
	.set GetCombinedEnemyWeaponUsabilityBits, 0x080188B4 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800D45C, 0x0800D45C + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_801883C, 0x0801883C + 1
	.set sub_801C514, 0x0801C514 + 1
	.set sub_801D180, 0x0801D180 + 1
	.set sub_801D20C, 0x0801D20C + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8033158, 0x08033158 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_8086784, 0x08086784 + 1
	.set sub_80890A0, 0x080890A0 + 1
	.set sub_808ABD8, 0x0808ABD8 + 1
	.section .text.sub_801C984, "ax", %progbits
@ sub_801C984 @ JP 0x0801C984 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C984
	.thumb_func
sub_801C984:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xff
	bl sub_801C514
	ldr r0, _0801C9AC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CA00
	ldr r4, _0801C9B0 @ =0x03004DF0
	ldr r0, [r4]
	cmp r0, #0
	bne _0801C9B4
	bl GetCombinedEnemyWeaponUsabilityBits
	b _0801C9DE
	.align 2, 0
_0801C9AC: .4byte 0x085775CC
_0801C9B0: .4byte 0x03004DF0
_0801C9B4:
	bl sub_8086784
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C9C2
	movs r4, #5
	b _0801CA4A
_0801C9C2:
	ldr r0, [r4]
	bl sub_801D180
	cmp r0, #2
	beq _0801C9E8
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801C9E8
	adds r0, r2, #0
	bl sub_801883C
_0801C9DE:
	movs r4, #2
	cmp r0, #3
	bne _0801CA4A
	movs r4, #6
	b _0801CA4A
_0801C9E8:
	ldr r1, _0801CA24 @ =0x0202BCAC
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_801D20C
	lsls r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	beq _0801CA4A
	movs r4, #1
_0801CA00:
	ldr r0, _0801CA28 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CA30
	ldr r0, _0801CA2C @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	movs r4, #2
	cmp r0, #0
	beq _0801CA4A
	movs r4, #0
	b _0801CA4A
	.align 2, 0
_0801CA24: .4byte 0x0202BCAC
_0801CA28: .4byte 0x085775CC
_0801CA2C: .4byte 0x03004DF0
_0801CA30:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CA3E
	movs r4, #3
	b _0801CA4A
_0801CA3E:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CA4A
	movs r4, #4
_0801CA4A:
	cmp r4, #6
	bls _0801CA50
	b _0801CC28
_0801CA50:
	lsls r0, r4, #2
	ldr r1, _0801CA5C @ =_0801CA60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CA5C: .4byte _0801CA60
_0801CA60: @ jump table
	.4byte _0801CA7C @ case 0
	.4byte _0801CA98 @ case 1
	.4byte _0801CAB8 @ case 2
	.4byte _0801CB3C @ case 3
	.4byte _0801CBB4 @ case 4
	.4byte _0801CC28 @ case 5
	.4byte _0801CBF8 @ case 6
_0801CA7C:
	ldr r0, _0801CA94 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801CA8A
	b _0801CC28
_0801CA8A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0801CC28
	.align 2, 0
_0801CA94: .4byte 0x0202BCEC
_0801CA98:
	ldr r0, _0801CAB4 @ =0x0202BE44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	bl sub_8015E18
	bl sub_801D730
	adds r0, r5, #0
	bl sub_8002DE4
	b _0801CC48
	.align 2, 0
_0801CAB4: .4byte 0x0202BE44
_0801CAB8:
	ldr r4, _0801CB2C @ =0x03004DF0
	ldr r0, [r4]
	cmp r0, #0
	beq _0801CAF8
	bl sub_807B4B8
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0801CAF8
	ldr r4, _0801CB30 @ =0x0202BE44
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl sub_8015E18
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetCursorMapPosition
_0801CAF8:
	ldr r2, _0801CB34 @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl sub_801D730
	bl RefreshEntityBmMaps
	bl sub_8027144
	ldr r0, _0801CB38 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CB20
	movs r0, #0x6b
	bl m4aSongNumStart
_0801CB20:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0801CC48
	.align 2, 0
_0801CB2C: .4byte 0x03004DF0
_0801CB30: .4byte 0x0202BE44
_0801CB34: .4byte 0x0202BCAC
_0801CB38: .4byte 0x0202BCEC
_0801CB3C:
	bl sub_800D45C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0801CC28
	ldr r2, _0801CBA4 @ =0x0202BCAC
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _0801CBA8 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _0801CBAC @ =0x0202BE44
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _0801CB70
	ldr r0, _0801CBB0 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_0801CB70:
	cmp r4, #0
	beq _0801CC28
	adds r0, r4, #0
	bl GetUnit
	bl CanShowUnitStatScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CC28
	bl sub_807B4B8
	movs r0, #0x1f
	bl sub_80890A0
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl sub_808ABD8
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	b _0801CC48
	.align 2, 0
_0801CBA4: .4byte 0x0202BCAC
_0801CBA8: .4byte 0x0202E4D4
_0801CBAC: .4byte 0x0202BE44
_0801CBB0: .4byte 0x03004DF0
_0801CBB4:
	ldr r0, _0801CBEC @ =0x03004DF0
	ldr r0, [r0]
	cmp r0, #0
	beq _0801CC28
	ldr r4, _0801CBF0 @ =0x0202BE44
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl sub_8015E18
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetCursorMapPosition
	ldr r0, _0801CBF4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CC28
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0801CC28
	.align 2, 0
_0801CBEC: .4byte 0x03004DF0
_0801CBF0: .4byte 0x0202BE44
_0801CBF4: .4byte 0x0202BCEC
_0801CBF8:
	ldr r4, _0801CC1C @ =0x0202BCAC
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_801D730
	ldrb r1, [r4, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801CC20
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801CC28
	.align 2, 0
_0801CC1C: .4byte 0x0202BCAC
_0801CC20:
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_0801CC28:
	ldr r0, _0801CC50 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_801D180
	cmp r0, #2
	bne _0801CC38
	bl sub_8033158
_0801CC38:
	ldr r1, _0801CC54 @ =0x0202BCAC
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl sub_8015AB4
_0801CC48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CC50: .4byte 0x03004DF0
_0801CC54: .4byte 0x0202BCAC

