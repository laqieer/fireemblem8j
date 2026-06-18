	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetAffinityName, 0x080286A4 + 1
	.set GetUnitAffinityIcon, 0x08028650 + 1
	.set GetUnitAid, 0x080186CC + 1
	.set GetUnitAidIconId, 0x08018804 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutNumberSmall, 0x08004AEC + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_8018EE4, 0x08018EE4 + 1
	.set sub_8018F24, 0x08018F24 + 1
	.set sub_8018F64, 0x08018F64 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.set sub_8018FAC, 0x08018FAC + 1
	.set sub_80190C0, 0x080190C0 + 1
	.set sub_80190EC, 0x080190EC + 1
	.set sub_80890BC, 0x080890BC + 1
	.set sub_8089268, 0x08089268 + 1
	.set sub_8089354, 0x08089354 + 1
	.section .text.sub_808941C, "ax", %progbits
@ DisplayPage0 @ JP 0x0808941C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DisplayPage0
	.thumb_func
DisplayPage0:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x50
	ldr r0, _08089454 @ =0x081F531C
	bl sub_80890BC
	ldr r5, _08089458 @ =0x02003BFC
	ldr r0, [r5, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _08089464
	ldr r0, _0808945C @ =0x0000048E
	bl sub_8009FA8
	adds r3, r5, #0
	adds r3, #0x30
	ldr r1, _08089460 @ =0x02003D6E
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	b _0808947E
	.align 2, 0
_08089454: .4byte 0x081F531C
_08089458: .4byte 0x02003BFC
_0808945C: .4byte 0x0000048E
_08089460: .4byte 0x02003D6E
_08089464:
	ldr r0, _0808966C @ =0x0000048D
	bl sub_8009FA8
	adds r2, r5, #0
	adds r2, #0x30
	ldr r1, _08089670 @ =0x02003D6E
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #4
	bl sub_8004374
_0808947E:
	ldr r5, _08089674 @ =0x02003BFC
	ldr r0, [r5, #0xc]
	bl sub_8018EC4
	ldr r1, [r5, #0xc]
	movs r3, #0x14
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #5
	movs r2, #1
	bl sub_8089354
	ldr r0, [r5, #0xc]
	bl sub_8018EE4
	adds r4, r0, #0
	ldr r2, [r5, #0xc]
	ldrb r1, [r2, #0x15]
	ldr r0, [r2, #0xc]
	movs r6, #0x10
	ands r0, r6
	cmp r0, #0
	beq _080894C2
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_080894C2:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x15]
	ldr r0, [r2, #0xc]
	ands r0, r6
	cmp r0, #0
	beq _080894DE
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_080894DE:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #5
	movs r2, #3
	bl sub_8089354
	ldr r0, [r5, #0xc]
	bl sub_8018F24
	adds r4, r0, #0
	ldr r2, [r5, #0xc]
	ldrb r1, [r2, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r6
	cmp r0, #0
	beq _0808950C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0808950C:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r6
	cmp r0, #0
	beq _08089528
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_08089528:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #5
	movs r2, #5
	bl sub_8089354
	ldr r0, [r5, #0xc]
	bl sub_8018FAC
	ldr r1, [r5, #0xc]
	movs r3, #0x19
	ldrsb r3, [r1, r3]
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #5
	movs r2, #7
	bl sub_8089354
	ldr r0, [r5, #0xc]
	bl sub_8018F64
	ldr r1, [r5, #0xc]
	movs r3, #0x17
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #5
	movs r2, #9
	bl sub_8089354
	ldr r0, [r5, #0xc]
	bl sub_8018F84
	ldr r1, [r5, #0xc]
	movs r3, #0x18
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #5
	movs r2, #0xb
	bl sub_8089354
	ldr r1, [r5, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x12
	ldrsb r3, [r0, r3]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	adds r0, r0, r3
	str r0, [sp]
	movs r7, #0xf
	str r7, [sp, #4]
	movs r0, #6
	movs r1, #0xd
	movs r2, #1
	bl sub_8089354
	ldr r1, [r5, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r0, r3, r0
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #0xd
	movs r2, #3
	bl sub_8089354
	ldr r6, _08089678 @ =0x02003E86
	ldr r0, [r5, #0xc]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r6, #2
	ldr r0, [r5, #0xc]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	adds r4, r5, #0
	adds r4, #0x78
	ldr r0, [r5, #0xc]
	bl sub_80190C0
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl sub_80043B8
	ldr r2, [r5, #0xc]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0xa
	beq _0808967C
	adds r4, #0x10
	adds r0, r2, #0
	bl sub_80190EC
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl sub_80043B8
	ldr r0, [r5, #0xc]
	adds r0, #0x30
	ldrb r2, [r0]
	adds r0, r7, #0
	ands r0, r2
	cmp r0, #0
	beq _080896A8
	movs r1, #0xc3
	lsls r1, r1, #1
	adds r0, r6, r1
	lsrs r2, r2, #4
	movs r1, #0
	bl PutNumberSmall
	b _080896A8
	.align 2, 0
_0808966C: .4byte 0x0000048D
_08089670: .4byte 0x02003D6E
_08089674: .4byte 0x02003BFC
_08089678: .4byte 0x02003E86
_0808967C:
	add r0, sp, #8
	adds r1, r2, #0
	movs r2, #0x48
	bl memcpy
	add r2, sp, #0x38
	ldrb r1, [r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x88
	add r0, sp, #8
	bl sub_80190EC
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl sub_80043B8
_080896A8:
	ldr r5, _080896E4 @ =0x02003F84
	ldr r4, _080896E8 @ =0x02003BFC
	ldr r0, [r4, #0xc]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r5, #0
	bl DrawIcon
	adds r5, r4, #0
	adds r5, #0x80
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	bl GetAffinityName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #2
	bl sub_80043B8
	bl sub_8089268
	add sp, #0x50
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080896E4: .4byte 0x02003F84
_080896E8: .4byte 0x02003BFC

