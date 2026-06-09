	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8004C84, 0x08004C84 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80A34F0, 0x080A34F0 + 1
	.section .text.sub_80A3528, "ax", %progbits
@ sub_80A3528 @ JP 0x080A3528 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3528
	.thumb_func
sub_80A3528:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r5, r0, #0
	bl ResetText
	ldr r4, _080A36C8 @ =0x02023CA8
	adds r0, r4, #0
	movs r1, #0
	bl sub_80011D0
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r4, #0x44
	movs r0, #0xc
	str r0, [sp]
	ldr r1, _080A36CC @ =0x08A9553C
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A357E
	b _080A3750
_080A357E:
	movs r0, #0x40
	adds r0, r0, r5
	mov sb, r0
	adds r1, r5, #0
	adds r1, #0x41
	str r1, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x42
	str r2, [sp, #0x10]
	adds r3, r5, #0
	adds r3, #0x39
	str r3, [sp, #8]
	movs r0, #0x3d
	adds r0, r0, r5
	mov sl, r0
	adds r1, #0xd
	str r1, [sp, #0x14]
	movs r6, #0x80
	lsls r6, r6, #1
	ldr r2, _080A36D0 @ =0x08A95438
	mov r8, r2
	movs r7, #4
_080A35AA:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r0}
	bl sub_8009FA8
	ldr r4, _080A36D4 @ =0x02023CAC
	adds r1, r6, r4
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	adds r6, #0x80
	subs r7, #1
	cmp r7, #0
	bge _080A35AA
	movs r7, #5
	movs r0, #0x9a
	lsls r0, r0, #3
	bl sub_8009FA8
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r6, #4
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	movs r3, #0x98
	lsls r3, r3, #1
	adds r0, r4, r3
	ldr r2, [r5, #0x58]
	movs r1, #2
	bl PutNumber
	movs r1, #0x99
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	ldr r0, _080A36D8 @ =0x000004D1
	bl sub_8009FA8
	movs r2, #0xce
	lsls r2, r2, #1
	adds r1, r4, r2
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	movs r3, #0xd4
	lsls r3, r3, #1
	adds r0, r4, r3
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r1, #0xd7
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r2, #0xd3
	lsls r2, r2, #1
	adds r0, r4, r2
	mov r3, sb
	ldrb r2, [r3]
	movs r1, #2
	bl PutNumber
	movs r1, #0xd6
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r3, [sp, #0xc]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_8004C84
	movs r1, #0xd9
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r3, [sp, #0x10]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_8004C84
	ldr r0, _080A36DC @ =0x000004D2
	bl sub_8009FA8
	adds r1, r4, #0
	adds r1, #0x4e
	str r7, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	adds r0, r4, #0
	adds r0, #0x56
	ldr r2, _080A36E0 @ =0x08A95524
	ldr r3, [sp, #8]
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #4
	bl PutSpecialChar
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A36E8
	ldr r0, _080A36E4 @ =0x000004D3
	bl sub_8009FA8
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	b _080A3700
	.align 2, 0
_080A36C8: .4byte 0x02023CA8
_080A36CC: .4byte 0x08A9553C
_080A36D0: .4byte 0x08A95438
_080A36D4: .4byte 0x02023CAC
_080A36D8: .4byte 0x000004D1
_080A36DC: .4byte 0x000004D2
_080A36E0: .4byte 0x08A95524
_080A36E4: .4byte 0x000004D3
_080A36E8:
	ldr r0, _080A3740 @ =0x000004D4
	bl sub_8009FA8
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #4
	bl sub_8004374
_080A3700:
	ldr r0, _080A3744 @ =0x000004D5
	bl sub_8009FA8
	ldr r4, _080A3748 @ =0x02023D16
	movs r5, #2
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	adds r0, r4, #4
	ldr r3, [sp, #0x14]
	ldrb r2, [r3]
	movs r1, #2
	bl PutNumber
	ldr r0, _080A374C @ =0x000004D6
	bl sub_8009FA8
	adds r4, #6
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	b _080A387C
	.align 2, 0
_080A3740: .4byte 0x000004D4
_080A3744: .4byte 0x000004D5
_080A3748: .4byte 0x02023D16
_080A374C: .4byte 0x000004D6
_080A3750:
	movs r7, #0
	adds r5, #0x3d
	mov sl, r5
	movs r5, #0x80
	lsls r5, r5, #1
	movs r4, #4
_080A375C:
	ldr r1, _080A3840 @ =0x08A95438
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8009FA8
	ldr r6, _080A3844 @ =0x02023CAC
	adds r1, r5, r6
	movs r2, #5
	mov sb, r2
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl sub_8004374
	movs r3, #3
	mov r8, r3
	str r3, [sp]
	movs r0, #8
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0x14
	bl sub_80A34F0
	adds r5, #0x80
	adds r4, #2
	adds r7, #1
	cmp r7, #4
	ble _080A375C
	movs r0, #0x9a
	lsls r0, r0, #3
	bl sub_8009FA8
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r1, r6, r2
	movs r4, #4
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl sub_8004374
	mov r3, r8
	str r3, [sp]
	movs r0, #0x15
	movs r1, #7
	movs r2, #1
	movs r3, #0x14
	bl sub_80A34F0
	ldr r0, _080A3848 @ =0x000004D1
	bl sub_8009FA8
	movs r2, #0xce
	lsls r2, r2, #1
	adds r1, r6, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl sub_8004374
	mov r3, r8
	str r3, [sp]
	movs r0, #0x15
	movs r1, #9
	movs r2, #1
	movs r3, #0x14
	bl sub_80A34F0
	ldr r0, _080A384C @ =0x000004D2
	bl sub_8009FA8
	adds r1, r6, #0
	adds r1, #0x4e
	mov r2, sb
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl sub_8004374
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_80A34F0
	mov r3, sl
	ldrb r0, [r3]
	cmp r0, #0
	bne _080A3854
	ldr r0, _080A3850 @ =0x000004D3
	bl sub_8009FA8
	adds r1, r6, #0
	adds r1, #0x5c
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl sub_8004374
	b _080A386C
	.align 2, 0
_080A3840: .4byte 0x08A95438
_080A3844: .4byte 0x02023CAC
_080A3848: .4byte 0x000004D1
_080A384C: .4byte 0x000004D2
_080A3850: .4byte 0x000004D3
_080A3854:
	ldr r0, _080A3894 @ =0x000004D4
	bl sub_8009FA8
	adds r1, r6, #0
	adds r1, #0x5c
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #4
	bl sub_8004374
_080A386C:
	movs r0, #4
	str r0, [sp]
	movs r0, #0x17
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_80A34F0
_080A387C:
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3894: .4byte 0x000004D4

