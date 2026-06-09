	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003D80, 0x08003D80 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003E6C, 0x08003E6C + 1
	.set sub_80040B8, 0x080040B8 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.section .text.sub_80353E8, "ax", %progbits
@ sub_80353E8 @ JP 0x080353E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80353E8
	.thumb_func
sub_80353E8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x2c]
	adds r0, #0x30
	ldr r1, _080354AC @ =0x06014800
	movs r2, #0x14
	bl sub_80044A4
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080354B0 @ =0x085C7440
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #1
_08035416:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _08035416
	cmp r5, #0
	beq _0803549A
	ldrb r0, [r5]
	movs r1, #0x5e
	adds r1, r1, r7
	mov r8, r1
	adds r6, r7, #0
	adds r6, #0x5c
	cmp r0, #1
	bls _08035488
	adds r4, r7, #0
	adds r4, #0x48
_0803544C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80040B8
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_8003D80
	cmp r0, #0xe0
	ble _08035482
	subs r5, #2
	adds r4, #8
	adds r0, r5, #0
	mov r1, sp
	bl sub_8003E6C
	adds r0, r7, #0
	adds r0, #0x48
	bl sub_8003D80
	adds r1, r0, #0
	ldr r0, [sp]
	subs r1, r1, r0
	subs r1, #0xc0
	adds r0, r4, #0
	bl sub_8003D84
_08035482:
	ldrb r0, [r5]
	cmp r0, #1
	bhi _0803544C
_08035488:
	ldr r0, [r7, #0x2c]
	bl sub_8003E0C
	adds r0, #0x10
	asrs r0, r0, #5
	adds r1, r0, #1
	mov r2, r8
	strh r1, [r2]
	strh r0, [r6]
_0803549A:
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080354AC: .4byte 0x06014800
_080354B0: .4byte 0x085C7440

