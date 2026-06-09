	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundTypeFlags, 0x08059864 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_80748E4, 0x080748E4 + 1
	.set sub_80749E0, 0x080749E0 + 1
	.section .text.sub_8074934, "ax", %progbits
@ sub_8074934 @ JP 0x08074934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074934
	.thumb_func
sub_8074934:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetAnimAnotherSide
	adds r4, r0, #0
	movs r6, #1
	rsbs r6, r6, #0
	adds r0, r5, #0
	bl sub_80749E0
	adds r0, r4, #0
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0807498C
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0807498C
	ldr r4, _080749A4 @ =0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8073F94
_0807498C:
	adds r0, r5, #0
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080749B2
	cmp r0, #1
	bgt _080749A8
	cmp r0, #0
	beq _080749AE
	b _080749B8
	.align 2, 0
_080749A4: .4byte 0x000003CF
_080749A8:
	cmp r0, #2
	beq _080749B6
	b _080749B8
_080749AE:
	movs r6, #0xd4
	b _080749B8
_080749B2:
	movs r6, #0xd5
	b _080749B8
_080749B6:
	ldr r6, _080749DC @ =0x000002CE
_080749B8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	beq _080749D6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, #0
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	movs r2, #1
	bl sub_8073F94
_080749D6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080749DC: .4byte 0x000002CE

