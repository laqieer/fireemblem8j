	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set InitText, 0x08003C8C + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80B4B48, "ax", %progbits
@ sub_80B4B48 @ JP 0x080B4B48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4B48
	.thumb_func
sub_80B4B48:
	push {r4, r5, r6, lr}
	ldr r6, _080B4C14 @ =0x06014000
	ldr r4, _080B4C18 @ =0x0201F148
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_80044A4
	ldr r0, _080B4C1C @ =0x085C7420
	movs r5, #0xd0
	lsls r5, r5, #2
	adds r1, r5, #0
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _080B4C20 @ =0x020228A8
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
	bl sub_8001EE4
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x28
	bl InitSpriteText
	adds r4, #0x30
	movs r5, #2
_080B4B8C:
	adds r0, r4, #0
	bl InitSpriteText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B4B8C
	movs r0, #0
	bl SetTextFont
	ldr r5, _080B4C18 @ =0x0201F148
	ldr r0, _080B4C24 @ =0x0001FFFF
	ands r0, r6
	lsrs r0, r0, #5
	ldr r2, _080B4C28 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x50
	strh r0, [r1]
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, r5, #0
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _080B4C2C @ =0x00000535
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl sub_80043B8
	adds r4, #0x30
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	bl sub_8003CF8
	movs r0, #0xe9
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C14: .4byte 0x06014000
_080B4C18: .4byte 0x0201F148
_080B4C1C: .4byte 0x085C7420
_080B4C20: .4byte 0x020228A8
_080B4C24: .4byte 0x0001FFFF
_080B4C28: .4byte 0x000003FF
_080B4C2C: .4byte 0x00000535

