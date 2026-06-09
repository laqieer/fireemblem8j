	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.section .text.sub_80906C8, "ax", %progbits
@ sub_80906C8 @ JP 0x080906C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80906C8
	.thumb_func
sub_80906C8:
	push {r4, lr}
	ldr r0, _08090704 @ =0x085C7420
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, _08090708 @ =0x02004BC4
	ldr r1, _0809070C @ =0x06017800
	adds r0, r4, #0
	movs r2, #0x1a
	bl sub_80044A4
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	subs r4, #8
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090704: .4byte 0x085C7420
_08090708: .4byte 0x02004BC4
_0809070C: .4byte 0x06017800

