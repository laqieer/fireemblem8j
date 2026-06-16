	.syntax unified
	.set ApplyMainMiniAnimHitEffect, 0x0805B734 + 1
	.set GetClassData, 0x0801911C + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set IsMainMiniAnimRoundEnd, 0x0805B710 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8059678, 0x08059678 + 1
	.set sub_805B784, 0x0805B784 + 1
	.set sub_805B7CC, 0x0805B7CC + 1
	.set sub_805BBB8, 0x0805BBB8 + 1
	.set sub_80D1844, 0x080D1844 + 1
	.set sub_80D2100, 0x080D2100 + 1
	.set sub_80D216C, 0x080D216C + 1
	.section .text.sub_80D1D1C, "ax", %progbits
@ LoadBattleSpritesForBranchScreen @ JP 0x080D1D1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global LoadBattleSpritesForBranchScreen
	.thumb_func
LoadBattleSpritesForBranchScreen:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x5c
	mov r8, r0
	ldr r0, _080D1D74 @ =0x03005390
	ldr r1, [r0, #0x14]
	str r1, [sp, #0x50]
	ldr r2, [r0, #0x18]
	str r2, [sp, #0x54]
	ldr r1, _080D1D78 @ =0x0201FADC
	ldr r6, [r1, #0x14]
	ldr r1, [r1, #0x18]
	str r1, [sp, #0x58]
	mov r3, r8
	adds r3, #0x40
	ldrb r1, [r3]
	adds r4, r0, #0
	cmp r1, #1
	beq _080D1D4A
	b _080D1E5C
_080D1D4A:
	ldrh r2, [r6, #0x32]
	movs r0, #0x32
	ldrsh r1, [r6, r0]
	ldr r0, _080D1D7C @ =0x00000117
	cmp r1, r0
	bgt _080D1D80
	adds r0, r2, #0
	adds r0, #0xc
	strh r0, [r6, #0x32]
	ldr r1, [sp, #0x58]
	ldrh r0, [r1, #0x32]
	adds r0, #0xc
	strh r0, [r1, #0x32]
	ldr r2, [sp, #0x50]
	ldrh r0, [r2, #2]
	adds r0, #0xc
	strh r0, [r2, #2]
	ldr r3, [sp, #0x54]
	strh r0, [r3, #2]
	b _080D1D84
	.align 2, 0
_080D1D74: .4byte 0x03005390
_080D1D78: .4byte 0x0201FADC
_080D1D7C: .4byte 0x00000117
_080D1D80:
	movs r0, #2
	strb r0, [r3]
_080D1D84:
	mov r0, r8
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #2
	beq _080D1D90
	b _080D1EA4
_080D1D90:
	bl sub_805B784
	ldr r0, _080D1E04 @ =0x03005390
	bl sub_805B7CC
	mov r1, r8
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	mov r7, r8
	adds r7, #0x41
	ldrb r0, [r7]
	lsls r0, r0, #1
	mov r4, r8
	adds r4, #0x2c
	adds r0, r4, r0
	movs r3, #0
	ldrsh r2, [r0, r3]
	mov sb, r2
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	ldrh r0, [r1]
	bl GetUnitFromCharId
	adds r1, r0, #0
	add r0, sp, #4
	movs r2, #0x48
	bl memcpy
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	bl GetClassData
	str r0, [sp, #8]
	ldr r4, [r0, #0x34]
	add r0, sp, #4
	bl GetUnitEquippedWeapon
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	add r3, sp, #0x4c
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_8059678
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	movs r2, #0
	ldr r0, _080D1E08 @ =0x089CDE18
	lsls r1, r5, #3
	subs r1, r1, r5
	b _080D1E1E
	.align 2, 0
_080D1E04: .4byte 0x03005390
_080D1E08: .4byte 0x089CDE18
_080D1E0C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #6
	bgt _080D1E30
	ldr r0, _080D1E90 @ =0x089CDE18
	lsls r1, r5, #3
	subs r1, r1, r5
	adds r1, r2, r1
_080D1E1E:
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, sb
	bne _080D1E0C
	ldr r0, _080D1E94 @ =0x089CEC18
	adds r0, r1, r0
	ldrb r0, [r0]
	subs r0, #1
	mov sl, r0
_080D1E30:
	ldrh r2, [r6, #0x32]
	adds r2, #0x28
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #6
	str r0, [sp]
	adds r0, r3, #0
	mov r1, sl
	movs r3, #0x58
	bl sub_80D216C
	ldr r0, _080D1E98 @ =0x0201FADC
	bl sub_805BBB8
	mov r1, r8
	ldr r0, [r1, #0x50]
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0x3a
	ldrsh r2, [r6, r3]
	bl sub_80D2100
_080D1E5C:
	mov r2, r8
	adds r2, #0x40
	ldrb r0, [r2]
	ldr r4, _080D1E9C @ =0x03005390
	cmp r0, #2
	bne _080D1EA4
	ldrh r1, [r6, #0x32]
	movs r3, #0x32
	ldrsh r0, [r6, r3]
	cmp r0, #0x82
	ble _080D1EA0
	movs r2, #0xc
	subs r0, r1, r2
	strh r0, [r6, #0x32]
	ldr r3, [sp, #0x58]
	ldrh r0, [r3, #0x32]
	subs r0, r0, r2
	strh r0, [r3, #0x32]
	ldr r1, [sp, #0x50]
	ldrh r0, [r1, #2]
	subs r0, r0, r2
	strh r0, [r1, #2]
	ldr r2, [sp, #0x54]
	strh r0, [r2, #2]
	b _080D1EA4
	.align 2, 0
_080D1E90: .4byte 0x089CDE18
_080D1E94: .4byte 0x089CEC18
_080D1E98: .4byte 0x0201FADC
_080D1E9C: .4byte 0x03005390
_080D1EA0:
	movs r0, #0
	strb r0, [r2]
_080D1EA4:
	adds r0, r4, #0
	bl IsMainMiniAnimRoundEnd
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D1EB6
	adds r0, r4, #0
	bl ApplyMainMiniAnimHitEffect
_080D1EB6:
	mov r0, r8
	bl sub_80D1844
	add sp, #0x5c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

