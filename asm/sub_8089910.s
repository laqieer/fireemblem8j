	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetCharacterAffinityIcon, 0x08028668 + 1
	.set GetCharacterData, 0x0801913C + 1
	.set GetSupportLevelUiChar, 0x08028680 + 1
	.set GetUnitSupportLevel, 0x080281D0 + 1
	.set GetUnitSupporterCharacter, 0x08028170 + 1
	.set GetUnitSupporterCount, 0x0802815C + 1
	.set GetUnitTotalSupportLevel, 0x080281F8 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8089910, "ax", %progbits
@ sub_8089910 @ JP 0x08089910 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089910
	.thumb_func
sub_8089910:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #6
	str r0, [sp, #8]
	ldr r4, _080899F8 @ =0x02003BFC
	ldr r0, [r4, #0xc]
	bl GetUnitTotalSupportLevel
	movs r1, #0
	str r1, [sp, #0xc]
	cmp r0, #5
	bne _08089934
	movs r0, #4
	str r0, [sp, #0xc]
_08089934:
	ldr r0, [r4, #0xc]
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov sb, r1
	movs r0, #0
	cmp r0, sl
	bge _080899E8
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, _080899F8 @ =0x02003BFC
	adds r1, r0, r1
	str r1, [sp, #0x10]
_08089950:
	ldr r1, _080899F8 @ =0x02003BFC
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportLevel
	adds r7, r0, #0
	cmp r7, #0
	beq _080899E0
	ldr r1, _080899F8 @ =0x02003BFC
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupporterCharacter
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [sp, #8]
	lsls r6, r0, #6
	ldr r1, _080899FC @ =0x02003D34
	mov r8, r1
	adds r5, r6, r1
	adds r0, r4, #0
	bl GetCharacterAffinityIcon
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	adds r0, r4, #0
	bl GetCharacterData
	ldrh r0, [r0]
	bl sub_8009FA8
	mov r1, r8
	adds r1, #6
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_8004374
	movs r5, #2
	cmp r7, #3
	bne _080899B6
	movs r5, #4
_080899B6:
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bne _080899BE
	movs r5, #4
_080899BE:
	mov r4, r8
	adds r4, #0x12
	adds r4, r6, r4
	adds r0, r7, #0
	bl GetSupportLevelUiChar
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutSpecialChar
	ldr r1, [sp, #8]
	adds r1, #2
	str r1, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r0, #8
	str r0, [sp, #0x10]
_080899E0:
	movs r1, #1
	add sb, r1
	cmp sb, sl
	blt _08089950
_080899E8:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080899F8: .4byte 0x02003BFC
_080899FC: .4byte 0x02003D34

