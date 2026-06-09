	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set PutText, 0x08003DA0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80A487C, 0x080A487C + 1
	.set sub_80A4D54, 0x080A4D54 + 1
	.section .text.sub_80A5774, "ax", %progbits
@ sub_80A5774 @ JP 0x080A5774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5774
	.thumb_func
sub_80A5774:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0x15
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080A57E8 @ =0x02013498
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_080A57A8:
	adds r0, r5, #0
	bl sub_8003CF8
	bl sub_80A487C
	cmp r6, r0
	bge _080A583E
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_80A4D54
	cmp r0, #1
	beq _080A57F6
	cmp r0, #1
	bgt _080A57EC
	cmp r0, #0
	beq _080A57F2
	b _080A5800
	.align 2, 0
_080A57E8: .4byte 0x02013498
_080A57EC:
	cmp r0, #2
	beq _080A57FC
	b _080A5800
_080A57F2:
	movs r0, #1
	b _080A57FE
_080A57F6:
	movs r1, #0
	mov sb, r1
	b _080A5800
_080A57FC:
	movs r0, #4
_080A57FE:
	mov sb, r0
_080A5800:
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D84
	adds r0, r5, #0
	mov r1, sb
	bl sub_8003D90
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A5860 @ =0x088582BC
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _080A5864 @ =0x02023CA8
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
_080A583E:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _080A57A8
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5860: .4byte 0x088582BC
_080A5864: .4byte 0x02023CA8

