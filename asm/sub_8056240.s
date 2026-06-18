	.syntax unified
	.set CheckRoundCrit, 0x0805B00C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundTypeFlags, 0x08059864 + 1
	.set GetEfxHp, 0x08059890 + 1
	.set GetUnitEfxDebuff, 0x080558AC + 1
	.set NewEfxNoDamage, 0x08053888 + 1
	.set SetUnitEfxDebuff, 0x0805587C + 1
	.set NewEfxHpBar, 0x08052FFC + 1
	.set NewEfxAvoid, 0x08053668 + 1
	.set sub_80546C8, 0x080546C8 + 1
	.set sub_8055128, 0x08055128 + 1
	.set sub_80554C4, 0x080554C4 + 1
	.section .text.sub_8056240, "ax", %progbits
@ StartBattleAnimHitEffects @ JP 0x08056240 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartBattleAnimHitEffects
	.thumb_func
StartBattleAnimHitEffects:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r1, #0
	str r2, [sp]
	mov sl, r3
	bl GetAnimPosition
	cmp r0, #0
	bne _0805626C
	ldr r0, _08056268 @ =0x02000000
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	mov sb, r1
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _08056278
	.align 2, 0
_08056268: .4byte 0x02000000
_0805626C:
	ldr r0, _08056288 @ =0x02000000
	ldr r7, [r0]
	ldr r1, [r0, #4]
	mov sb, r1
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_08056278:
	mov r8, r0
	cmp r4, #0
	beq _0805628C
	cmp r4, #1
	bne _08056284
	b _080563AA
_08056284:
	b _080563B0
	.align 2, 0
_08056288: .4byte 0x02000000
_0805628C:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r6
	cmp r0, #0
	beq _080562D8
	adds r0, r7, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080562D8
	adds r0, r7, #0
	movs r1, #1
	bl SetUnitEfxDebuff
_080562D8:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r4
	cmp r0, #0
	beq _080562F4
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080562F4
	adds r0, r5, #0
	movs r1, #1
	bl SetUnitEfxDebuff
_080562F4:
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08056308
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08056310
_08056308:
	adds r0, r5, #0
	adds r5, r7, #0
	adds r7, r0, #0
	mov r8, sb
_08056310:
	ldr r4, _08056378 @ =0x0203E14E
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r6, r4
	beq _0805639E
	adds r0, r5, #0
	bl NewEfxHpBar
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805637C
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sl
	bl NewEfxHitQuake
	b _08056386
	.align 2, 0
_08056378: .4byte 0x0203E14E
_0805637C:
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp]
	bl NewEfxHitQuake
_08056386:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl sub_8055128
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_80554C4
	b _080563B0
_0805639E:
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0
	bl NewEfxNoDamage
	b _080563B0
_080563AA:
	adds r0, r5, #0
	bl NewEfxAvoid
_080563B0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

