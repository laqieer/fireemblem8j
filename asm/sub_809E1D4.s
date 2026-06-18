	.syntax unified
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_809E1D4, "ax", %progbits
@ DrawPrepScreenItemUseStatLabels @ JP 0x0809E1D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawPrepScreenItemUseStatLabels
	.thumb_func
DrawPrepScreenItemUseStatLabels:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0809E240 @ =0x02013498
	adds r5, r6, #0
	movs r4, #7
_0809E1E4:
	adds r0, r5, #0
	bl sub_8003CF8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809E1E4
	movs r0, #0x8f
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r1, r6, #0
	adds r6, #8
	ldr r5, _0809E244 @ =0x02023D88
	movs r7, #0
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0809E24C
	ldr r0, _0809E248 @ =0x0000048E
	bl sub_8009FA8
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	b _0809E268
	.align 2, 0
_0809E240: .4byte 0x02013498
_0809E244: .4byte 0x02023D88
_0809E248: .4byte 0x0000048E
_0809E24C:
	ldr r0, _0809E354 @ =0x0000048D
	bl sub_8009FA8
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
_0809E268:
	ldr r0, _0809E358 @ =0x0000047B
	bl sub_8009FA8
	adds r1, r6, #0
	adds r6, #8
	ldr r7, _0809E35C @ =0x02023E88
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809E360 @ =0x0000047C
	bl sub_8009FA8
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809E364 @ =0x0000047D
	bl sub_8009FA8
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809E368 @ =0x0000047E
	bl sub_8009FA8
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x72
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809E36C @ =0x0000047F
	bl sub_8009FA8
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xe
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809E370 @ =0x00000486
	bl sub_8009FA8
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8e
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl sub_8003EAC
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _0809E374 @ =0xFFFFFE8A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl sub_8004374
	ldr r1, _0809E378 @ =0xFFFFFE82
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E354: .4byte 0x0000048D
_0809E358: .4byte 0x0000047B
_0809E35C: .4byte 0x02023E88
_0809E360: .4byte 0x0000047C
_0809E364: .4byte 0x0000047D
_0809E368: .4byte 0x0000047E
_0809E36C: .4byte 0x0000047F
_0809E370: .4byte 0x00000486
_0809E374: .4byte 0xFFFFFE8A
_0809E378: .4byte 0xFFFFFE82

