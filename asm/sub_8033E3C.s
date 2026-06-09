	.syntax unified
	.set CanShowUnitStatScreen, 0x0801C590 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_801C514, 0x0801C514 + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80890A0, 0x080890A0 + 1
	.set sub_808ABD8, 0x0808ABD8 + 1
	.section .text.sub_8033E3C, "ax", %progbits
@ sub_8033E3C @ JP 0x08033E3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033E3C
	.thumb_func
sub_8033E3C:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_801C514
	ldr r0, _08033E98 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08033EA8
	bl sub_807B4B8
	ldr r0, _08033E9C @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r2, _08033EA0 @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl sub_801D730
	bl RefreshEntityBmMaps
	bl sub_8027144
	ldr r0, _08033EA4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033E8C
	movs r0, #0x6b
	bl m4aSongNumStart
_08033E8C:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _08033F60
	.align 2, 0
_08033E98: .4byte 0x085775CC
_08033E9C: .4byte 0x03004DF0
_08033EA0: .4byte 0x0202BCAC
_08033EA4: .4byte 0x0202BCEC
_08033EA8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08033F0A
	ldr r2, _08033F68 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08033F6C @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _08033F70 @ =0x0202BE44
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _08033EDA
	ldr r0, _08033F74 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_08033EDA:
	cmp r4, #0
	beq _08033F0A
	adds r0, r4, #0
	bl GetUnit
	bl CanShowUnitStatScreen
	cmp r0, #0
	beq _08033F0A
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
_08033F0A:
	ldr r0, _08033F78 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033F50
	ldr r0, _08033F74 @ =0x03004DF0
	ldr r0, [r0]
	cmp r0, #0
	beq _08033F50
	ldr r4, _08033F70 @ =0x0202BE44
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
	ldr r0, _08033F7C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033F50
	movs r0, #0x6b
	bl m4aSongNumStart
_08033F50:
	ldr r1, _08033F68 @ =0x0202BCAC
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl sub_8015AB4
_08033F60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033F68: .4byte 0x0202BCAC
_08033F6C: .4byte 0x0202E4D4
_08033F70: .4byte 0x0202BE44
_08033F74: .4byte 0x03004DF0
_08033F78: .4byte 0x085775CC
_08033F7C: .4byte 0x0202BCEC

