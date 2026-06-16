	.syntax unified
	.set CheckRoundCrit, 0x0805B00C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEfxHp, 0x08059890 + 1
	.set NewEfxNoDamage, 0x08053888 + 1
	.set NewEfxHpBarResire, 0x080532DC + 1
	.set sub_8053668, 0x08053668 + 1
	.set sub_80546C8, 0x080546C8 + 1
	.set sub_8055128, 0x08055128 + 1
	.set sub_80554C4, 0x080554C4 + 1
	.section .text.sub_80563C0, "ax", %progbits
@ StartBattleAnimResireHitEffects @ JP 0x080563C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartBattleAnimResireHitEffects
	.thumb_func
StartBattleAnimResireHitEffects:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	bl GetAnimPosition
	cmp r0, #0
	bne _080563E0
	ldr r0, _080563DC @ =0x02000000
	ldr r7, [r0, #8]
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _080563E8
	.align 2, 0
_080563DC: .4byte 0x02000000
_080563E0:
	ldr r0, _08056440 @ =0x02000000
	ldr r7, [r0]
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_080563E8:
	mov r8, r0
	ldr r4, _08056444 @ =0x0203E14E
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
	mov r0, sb
	cmp r0, #0
	beq _08056448
	cmp r0, #1
	beq _080564A0
	b _080564A6
	.align 2, 0
_08056440: .4byte 0x02000000
_08056444: .4byte 0x0203E14E
_08056448:
	cmp r6, r4
	beq _0805648A
	adds r0, r5, #0
	bl NewEfxHpBarResire
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08056468
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #4
	bl sub_80546C8
	b _08056472
_08056468:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl sub_80546C8
_08056472:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl sub_8055128
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_80554C4
	b _080564A6
_0805648A:
	ldr r1, _0805649C @ =0x02017750
	movs r0, #2
	str r0, [r1]
	adds r0, r5, #0
	mov r1, r8
	movs r2, #1
	bl NewEfxNoDamage
	b _080564A6
	.align 2, 0
_0805649C: .4byte 0x02017750
_080564A0:
	adds r0, r5, #0
	bl sub_8053668
_080564A6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

