	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A2108, "ax", %progbits
@ sub_80A2108 @ JP 0x080A2108 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2108
	.thumb_func
sub_80A2108:
	push {r4, r5, lr}
	ldr r4, _080A2184 @ =0x02013640
	ldr r1, _080A2188 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl sub_80044A4
	ldr r0, _080A218C @ =0x085C7420
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	adds r5, r4, #0
	adds r5, #0x90
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl sub_80045BC
	ldr r0, _080A2190 @ =0x00000527
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl sub_80043B8
	ldr r0, _080A2194 @ =0x00000526
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #0
	bl sub_80043B8
	movs r0, #0xa5
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #3
	bl sub_80043B8
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2184: .4byte 0x02013640
_080A2188: .4byte 0x06011000
_080A218C: .4byte 0x085C7420
_080A2190: .4byte 0x00000527
_080A2194: .4byte 0x00000526

