	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80B4C30, "ax", %progbits
@ sub_80B4C30 @ JP 0x080B4C30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4C30
	.thumb_func
sub_80B4C30:
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080B4C44
	ldr r0, _080B4C40 @ =0x00000747
	b _080B4C4E
	.align 2, 0
_080B4C40: .4byte 0x00000747
_080B4C44:
	ldr r0, _080B4C98 @ =0x08A9DDDC
	lsls r1, r1, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
_080B4C4E:
	bl sub_8009FA8
	adds r5, r0, #0
	ldr r4, _080B4C9C @ =0x0201F148
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	movs r0, #0xb0
	adds r1, r5, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003D84
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003F28
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C98: .4byte 0x08A9DDDC
_080B4C9C: .4byte 0x0201F148

